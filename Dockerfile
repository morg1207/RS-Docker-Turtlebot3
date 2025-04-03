# Usa ARG para permitir especificar la versión de ROS durante el build
ARG ROS_DISTRO=foxy  # Valor por defecto

FROM osrf/ros:foxy-desktop

# Configurar el shell para que siempre cargue ROS

WORKDIR /
RUN mkdir -p /ros2_ws/src
RUN mkdir -p /simulation_ws/src
RUN mkdir  /notebook_ws

WORKDIR /ros2_ws

SHELL ["/bin/bash", "-c"]

# Instalar herramientas adicionales
RUN apt-get update && apt-get install -y \
    ros-dev-tools \
    nano \
    git &&\
    rm -rf /var/lib/apt/lists/*

# Instalar herramientas adicionales en grupos lógicos
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-turtlesim \
    ros-${ROS_DISTRO}-teleop-twist-keyboard && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-ros-pkgs && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -b ros-foxy https://github.com/morg1207/RS-Turttlebot3.git /simulation_ws/src/RS-Turttlebot3
    
# Configurar el entorno para ROS en todos los shells
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
    echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

# Construir el workspace
RUN cd /simulation_ws && \
    . /opt/ros/${ROS_DISTRO}/setup.sh && \
    apt-get update && \
    rosdep init || true && \
    rosdep update --rosdistro $ROS_DISTRO && \
    rosdep fix-permissions && \
    rosdep install -i --from-path src --rosdistro $ROS_DISTRO -y --skip-keys "turtlebot3-fake-node" && \
    colcon build --symlink-install

COPY ./ros_entrypoint.sh /ros_entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "source /ros_entrypoint.sh"]