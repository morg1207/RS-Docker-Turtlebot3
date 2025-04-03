## DOCKER PARA EL PROYECTO: ROS1 CONCEPTOS BÁSICOS DE THE CONSTRUCT

### Nota: Te encuentras en la rama de ros-noetic

### 1. Instrucciones para ejecutar en Windows

#### 1.1 Sotfware necesario
1. Tener instalado WSL2
1. Tener instalado Docker Desktop
2. Tener un servidor X11 para linux (https://sourceforge.net/projects/xming/)

#### 1.2 Configuración previa
1. Ejecutar Docker Desktop
2. Ejecutar servidor X11 instalado

#### 1.3 Descargar archivos

```bash
# Crear carpeta de trabajo
mkdir -p ~/docker/ros-conceptos-basicos
# Ir a mi carpeta de trabajo
cd ~/docker/ros-conceptos-basicos
# Clonar repositorio
git clone -b ros-noetic https://github.com/morg1207/RS-Docker-Turtlebot3.git
```

#### 1.4 Compilar Docker
```bash
#Ir a la carpeta de archivos
cd ~/docker/ros-conceptos-basicos
# Construir imagen
sudo docker compose build 
```

#### 1.3 Ejecutar Docker Compose

```bash
# Ejecutar docker compose 
sudo docker compose up
```

#### 1.4 Ejecutar simulacion
```bash
# Ir a mi carpeta de simulación
cd /simulation_ws/
# Configuro el espacio de trabajo
source /simulation_ws/devel/setup.bash
# Lanza el launch de la simulación
roslaunch realrobotlab main.launch
```

## 2 Linux

#### 1.3 Ejecutar docker 
1. Ejecutar Docker Desktop
2. Ejecutar servidor X11 instalado
3. Ejecutar docker compose 
```bash
DISPLAY_VALUE=:0 docker-compose up
```