# Argumento para usarlo a lo largo del dockerfile 
ARG ROS_DISTRO=foxy  # Valor por defecto

# Imagen base
FROM osrf/ros:foxy-desktop

# Asegurar de estar en la raiz del directorio de archivos
WORKDIR /

# Crear tres espacios de trabajos
RUN mkdir -p /ros2_ws/src
RUN mkdir -p /simulation_ws/src
RUN mkdir  /notebook_ws

# Configurar el shell por defecto
SHELL ["/bin/bash", "-c"]

# Instalar herramientas adicionales
RUN apt-get update && apt-get install -y \
    ros-dev-tools \
    nano \
    git &&\
    rm -rf /var/lib/apt/lists/*

# Instalar packages de ROS
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-turtlesim \
    ros-${ROS_DISTRO}-teleop-twist-keyboard && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-ros-pkgs && \
    rm -rf /var/lib/apt/lists/*

# Argumento para evitar el caché y siempre tener actualizado mi repositorio
ARG CACHEBUST=1

# Clonar el repositorio del simulador de Turtlebot3
RUN git clone -b ros-foxy https://github.com/morg1207/RS-Turttlebot3.git /simulation_ws/src/RS-Turttlebot3
    
# Decargar dependencias de simulación y compilar la simulación
RUN cd /simulation_ws && \
    . /opt/ros/${ROS_DISTRO}/setup.sh && \
    apt-get update && \
    rosdep init || true && \
    rosdep update --rosdistro $ROS_DISTRO && \
    rosdep fix-permissions && \
    rosdep install -i --from-path src --rosdistro $ROS_DISTRO -y --skip-keys "turtlebot3-fake-node" && \
    colcon build --symlink-install

# Posicionar el terminal en mi espacio de trabajo
WORKDIR /ros2_ws

# Configurar el entorno para ROS en todos los shells
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
    echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

# Copiar el script de entrada
COPY ./ros_entrypoint.sh /ros_entrypoint.sh

# Establecer el punto de entrada
ENTRYPOINT ["/bin/bash", "-c", "source /ros_entrypoint.sh"]