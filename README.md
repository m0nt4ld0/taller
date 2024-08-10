# Mi taller 👩‍💻🔨
Proyecto misceláneo que reúne soluciones "fatto in casa" para automatizar/resolver mis problemas cotidianos (scripts que hacen la creación de carpetas de a lotes para organizar fotos o apuntes, tareas de mantenimiento de mis equipos, etc).

## Macro VBA - Crear árbol de carpetas por materia, con fechas de clases 📚👩‍🏫
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
## Powershell - Descargar ROMs para emuladores de juego 🕹️
El script permite descargar de forma masiva desde Retrostic todas las ROMs disponibles para la consola que se pase como parámetro, en la página que se pase como parámetro.
Almacena las ROMs descargadas en la carpeta de Descargas de Windows, generando una nueva carpeta con el nombre de la consola (o sobreescribiendo la que ya exista).
El siguiente ejemplo descarga todos los juegos de Sega Genesis en una carpeta de nombre "megadrive" dentro de la carpeta "Descargas"
```
.\bajarjuegos.ps1 -consola "megadrive" -pagina 1
```

En este apartado se encuentra el listado con los códigos de consolas que puede recibir el parámetro ```-consola```

|Código|Consola|
|------|-------|
|mame|M.A.M.E. - Multiple Arcade Machine Emulator|
|snes|Super Nintendo Entertainment System|
|ps-1|Sony PSX/PlayStation 1|
|nds|Nintendo DS|
|n64|Nintendo 64|
|gba|Game Boy Advance|
|nes|Nintendo Entertainment System|
|neo-geo|Neo Geo|
|psp|PlayStation Portable|
|gamecube|Nintendo GameCube|
|ps-2|Sony PlayStation 2|
|wii|Nintendo Wii|Nintendo Wii|
|megadrive|Sega Genesis|
|saturn|Sega Saturn|
|gbc|Nintendo Game Boy Color|
|cps-2|Capcom Play System 2|
|cps-1|Capcom Play System 1|
|gb|Nintendo Game Boy|
|turbografx16|PC Engine - TurboGrafx16|
|ps-3|Sony PlayStation 3|
|naomi|Sega NAOMI|
|atari-2600|Atari 2600|
|master-system|Sega Master System|
|sharp-x68000|Sharp X68000|
|atari-st|Atari ST|
|zx-spectrum|ZX Spectrum|
|c64-tapes|Commodore 64 Tapes(C64/CBM64)|
|game-gear|Sega Game Gear|
|famicom|Nintendo Famicom (Family Computer System)|
|cps-3|Capcom Play System 3|
|sega-32x|Sega 32X|
|atari-5200|Atari 5200|
|atari-7800|Atari 7800|
|dreamcast|Sega Dreamcast|
|atari-lynx|Atari Lynx|
|atari-jaguar|Atari Jaguar|
|neo-geo-pocket|Neo Geo Pocket|
|c64-preservation|Commodore 64 Preservation Project|
|bbc-micro|Acorn BBC Micro Model B|
|cd-i|Philips CD-i|
|wonderswan-color|Bandai Wonderswan Color|
|wonderswan|Bandai Wonderswan|
|virtual-boy|Nintendo Virtual Boy|
|3do|3DO Interactive Multiplayer|
