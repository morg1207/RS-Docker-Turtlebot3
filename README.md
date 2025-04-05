# Arquitectura de Integración: ROS + Docker + GitHub

Todo el contenido se encuentra en las ramas creadas para cada versión específica de ROS.
## Arquitecturas

### Arquitectura para Windows con WSL2
<img src="images/architecture_windows.png" alt="Diagrama de arquitectura para Windows/WSL2" width="800" style="display: block; margin: 0 auto; border: 1px solid #eee; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);"/>

### Arquitectura para Linux Nativo
<img src="images/architecture_linux.png" alt="Diagrama de arquitectura para Windows/WSL2" width="800" style="display: block; margin: 0 auto; border: 1px solid #eee; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);"/>

## Comparativa de Ambientes

| Característica          | Windows/WSL2                  | Linux Nativo               |
|-------------------------|-------------------------------|----------------------------|
| Rendimiento             | 80-90% de Linux               | Máximo rendimiento         |
| Soporte GPU             | Requiere drivers       | Soporte completo           |
| Soporte gráfico         | Necesita X server externo     | Integrado                  |
| Facilidad de setup      | Moderado (3-5 pasos)          | Simple (1-3 pasos)         |
| Compatibilidad hardware | Limitada (USB, dispositivos)  | Completa                  |

## Estructura del Repositorio por Versiones de ROS
El proyecto organiza su desarrollo en ramas específicas para cada distribución de ROS:
- `ros-foxy`: Versión Foxy Fitzroy (LTS)
- `ros-noetic`: Versión Humble Hawksbill (LTS)
- `ros-humble`: Versión Rolling Ridley (en desarrollo)
