# 🐳 Docker para ROS Foxy - Conceptos Básicos (The Construct)  
**Rama actual:** `ros-foxy`  

<img src="./images/ros_foxy.png" alt="Ros_foxy" width="200"/>
---

## 🖥️ **1. Configuración para Windows**  

### 📋 **1.1 Requisitos de sotfware**  
| Software | Enlace |
|----------|--------|
| WSL2 | [Instalación](https://aka.ms/wsl2-install) |
| Docker Desktop | [Descarga](https://docs.docker.com/desktop/setup/install/windows-install/) |
| Xming Server  | [Descarga](https://sourceforge.net/projects/xming/) |
| Visual Studio Code  | [Descarga](https://code.visualstudio.com/) |

 1. Se necesita que **Docker Desktop** Compose este ejecutándose.
 2. Se necesita **xlaunch server** este ejecutándose.


### 📥 **1.2 Clonar Repositorio**  
```bash
# Crear carpeta de trabajo
mkdir -p ~/docker/ros2-conceptos-basicos
# Ir a mi carpeta de trabajo
cd ~/docker/ros2-conceptos-basicos
# Clonar repositorio
git clone -b ros-foxy https://github.com/morg1207/RS-Docker-Turtlebot3.git ~/docker/ros2-conceptos-basicos
```

### 🐋 **1.3 Construcción del Entorno Docker**  

1. 🔨 **Compilar Imagen**  
```bash
#Ir a la carpeta de archivos
cd ~/docker/ros2-conceptos-basicos
# Construir imagen
sudo docker compose build 
```

2. 🚀 **Ejecutar Contenedor**  
```bash
# Detengo el contendor si esta en ejecución
sudo docker container stop cont_ros_foxy_turtlebot3
# Eliminar contenedor si ya existe
sudo docker container rm cont_ros_foxy_turtlebot3
# Ejecutar docker compose 
sudo docker compose up
```


### 🤖 **1.4. Simulación con TurtleBot3**  

1. 📂 **Ejecutar Simulación**  
```bash
# Ejecutar un terminal dentro del contenedor
docker exec -it cont_ros_foxy_turtlebot3 bash
# Ir a mi carpeta de simulación
cd /simulation_ws
# Configurar el espacio de trabajo
source install/setup.bash
# Lanzar el launch de la simulación
ros2 launch turtlebot3_gazebo main_turtlebot3_lab.launch.xml
```
### 🛠 **1.5 Configuración Avanzada con Dev Containers**   

**Recomendación profesional:** Para un flujo de trabajo integrado en ROS, utiliza **VS Code con Dev Containers** para:  
- 🔄 Desarrollo nativo dentro del contenedor  
- 📁 Acceso completo al filesystem  
- 🐛 Depuración integrada  
-  Extensiones de VS Code integradas y configuradas

#### **Pasos para configuración:**  

1. **Instalar requisitos previos:** 
   - [VS Code](https://code.visualstudio.com/)  
   - Extensión [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)  

2. **Abrir el proyecto en un contenedor:**  
```bash
# Ir a la carpeta de archivos
cd ~/docker/ros2-conceptos-basicos
# Abro VS Code desde este carpeta
code ./
```
    Presiona `Ctrl+Shift+P` → **"Dev Container: Reopen in Container"**  
   *VS Code detectará automáticamente la configuración en `.devcontainer/`*

---
## 🐧 **2. Configuración para Linux**  

### 📋 **2.1 Requisitos**  
| Software | Enlace |
|----------|--------|
| Docker Engine | [Descarga](https://docs.docker.com/engine/install/ubuntu/) |
| Visual Studio Code  | [Descarga](https://code.visualstudio.com/) |


### 📥 **2.2 Clonar Repositorio**  
```bash
# Crear carpeta de trabajo
mkdir -p ~/docker/ros2-conceptos-basicos
# Ir a mi carpeta de trabajo
cd ~/docker
# Clonar repositorio
git clone -b ros-foxy https://github.com/morg1207/RS-Docker-Turtlebot3.git ~/docker/ros2-conceptos-basicos
```

### 🐋 **2.3 Construcción del Entorno Docker**  

1. 🔨 **Compilar Imagen**  
```bash
#Ir a la carpeta de archivos
cd ~/docker/ros2-conceptos-basicos
# Construir imagen
sudo docker compose build 
```

2. 🚀 **Ejecutar Contenedor**  
```bash
# Eliminar contenedor si ya existe
sudo docker container rm cont_ros_foxy_turtlebot3
# Ejecutar docker compose 
DISPLAY_VALUE=:0 docker-compose up
```


### 🤖 **2.4. Simulación con TurtleBot3**  

1. 📂 **Ejecutar Simulación**  
```bash
# Ejecutar un terminal dentro del contenedor
docker exec -it cont_ros_foxy_turtlebot3 bash
# Ir a mi carpeta de simulación
cd /simulation_ws
# Configurar el espacio de trabajo
source install/setup.bash
# Lanzar el launch de la simulación
ros2 launch turtlebot3_gazebo main_turtlebot3_lab.launch.xml
```
### 🛠 **2.5 Configuración Avanzada con Dev Containers**   

**Recomendación profesional:** Para un flujo de trabajo integrado en ROS, utiliza **VS Code con Dev Containers** para:  
- 🔄 Desarrollo nativo dentro del contenedor  
- 📁 Acceso completo al filesystem  
- 🐛 Depuración integrada  

#### **Pasos para configuración:**  

1. **Instalar requisitos previos:** 
   - [VS Code](https://code.visualstudio.com/)  
   - Extensión [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)  

2. **Abrir el proyecto en un contenedor:**  

    Presiona `Ctrl+Shift+P` → **"Dev Container: Reopen in Container"**  
   *VS Code detectará automáticamente la configuración en `.devcontainer/`*
