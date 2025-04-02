# Argumento para usarlo a lo largo del dockerfile 
ARG ROS_DISTRO=foxy  # Valor por defecto

# Imagen base
FROM osrf/ros:noetic-desktop-full

# Asegurar de estar en la raiz del directorio de archivos
WORKDIR /

# Crear tres espacios de trabajos
RUN mkdir -p /catkin_ws/src
RUN mkdir -p /simulation_ws/src
RUN mkdir  /notebook_ws

# Configurar el shell por defecto
SHELL ["/bin/bash", "-c"]

# Instalar herramientas adicionales
RUN apt-get update && apt-get install -y \
    ros-noetic-turtlesim \
    ros-noetic-teleop-twist-keyboard \
    nano \
    git \
    python3-rosdep \
    python3-catkin-tools && \
    rm -rf /var/lib/apt/lists/*

# Argumento para evitar el caché y siempre tener actualizado mi repositorio
ARG CACHEBUST=1

# Clonar el repositorio del simulador de warehouse
RUN git clone -b ros-noetic https://github.com/morg1207/RS-Turtlebot3.git /simulation_ws/src/RS-Turttlebot3

# Decargar dependencias de simulación y compilar la simulación
RUN cd /simulation_ws && \
    . /opt/ros/${ROS_DISTRO}/setup.sh && \
    apt-get update && \
    rosdep init || true && \
    rosdep update --rosdistro $ROS_DISTRO && \
    rosdep fix-permissions && \
    rosdep install -i --from-path src --rosdistro $ROS_DISTRO -y && \
    colcon build --symlink-install

# Posicionar el terminal en mi espacio de trabajo
WORKDIR /catkin_ws

# Configurar el entorno para ROS en todos los shells
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
    echo "source /catkin_ws/devel/setup.bash"" >> ~/.bashrc

# Copiar el script de entrada
COPY ./ros_entrypoint.sh /ros_entrypoint.sh

# Establecer el punto de entrada
ENTRYPOINT ["/bin/bash", "-c", "source /ros_entrypoint.sh"]