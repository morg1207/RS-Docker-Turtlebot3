## DOCKER PARA EL PROYECTO DE ROS2 CONCEPTOS BÁSICOS DE THE CONSTRUCT

#### Te encuentras en la rama de ros-foxy

### 1 Windows

#### 1.1 Sotfware necesario
1. Tener instalado Docker Desktop
2. Tener un servidor X11 para linux (https://sourceforge.net/projects/xming/)

#### 1.2 Configuración previa
1. Ejecutar Docker Desktop
2. Ejecutar servidor X11 instalado

#### 1.3 Ejecutar docker 
1. Ejecutar Docker Desktop
2. Ejecutar servidor X11 instalado
3. Ejecutar docker compose 
```bash
sudo docker compose up
```

#### 1.4 Compilar simulación
```bash
cd /simulation_ws/
sudo apt update
rosdep init
rosdep update --rosdistro $ROS_DISTRO
rosdep install -i --from-path src --rosdistro $ROS_DISTRO -y
colcon build --symlink-install
```

#### 1.4 Ejecutar simulacion
```bash
cd /simulation_ws/
source /simulation_ws/install/setup.bash
ros2 launch turtlebot3_gazebo main_turtlebot3_lab.launch.xml
```

## 2 Linux

#### 1.3 Ejecutar docker 
1. Ejecutar Docker Desktop
2. Ejecutar servidor X11 instalado
3. Ejecutar docker compose 
```bash
DISPLAY_VALUE=:0 docker-compose up
```