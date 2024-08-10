# Mi taller
Proyecto misceláneo que reúne soluciones "fatto in casa" para automatizar/resolver mis problemas cotidianos (scripts que hacen la creación de carpetas de a lotes para organizar fotos o apuntes, tareas de mantenimiento de mis equipos, etc).

## Macro VBA - Crear árbol de carpetas por materia, con fechas de clases
Esta macro de Visual Basic for Applications (VBA) automatiza la creación de un árbol de carpetas y subcarpetas para organizar los apuntes de clase. La macro genera una carpeta para cada materia y, dentro de ella, subcarpetas con los nombres de las fechas de las clases. Por ejemplo:
```
/Mis Apuntes/
│
├── Matemáticas/
│ ├── 20240801/
│ ├── 20240803/
│ └── 20240805/
│
├── Física/
│ ├── 20240802/
│ ├── 20240804/
│ └── 20240806/
│
└── Química/
├── 20240801/
├── 20240803/
└── 20240807/
```
## Powershell - Descargar ROMs para emuladores de juego
El script permite descargar de forma masiva desde Retrostic todas las ROMs disponibles para la consola que se pase como parámetro, en la página que se pase como parámetro.
Almacena las ROMs descargadas en la carpeta de Descargas de Windows, generando una nueva carpeta con el nombre de la consola (o sobreescribiendo la que ya exista).
El siguiente ejemplo descarga todos los juegos de Sega Genesis en una carpeta de nombre "megadrive" dentro de la carpeta "Descargas"
```
.\bajarjuegos.ps1 -consola "megadrive" -pagina 1
```
