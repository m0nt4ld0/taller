# Mi taller 👩‍💻🔨
Proyecto misceláneo que reúne soluciones "fatto in casa" para automatizar/resolver mis problemas cotidianos (scripts que hacen la creación de carpetas de a lotes para organizar fotos o apuntes, tareas de mantenimiento de mis equipos, etc).

## 📚 Tabla de Contenidos

- [Macro VBA - Crear árbol de carpetas por materia, con fechas de clases 📚👩‍🏫](#macro-vba---crear-árbol-de-carpetas-por-materia-con-fechas-de-clases-)
- [Powershell/Bash - Descargar ROMs para emuladores de juego 🕹️](#powershellbash---descargar-roms-para-emuladores-de-juego)
  - [Versión del script para Linux (Bash) 🐧](#versión-del-script-para-linux-bash-)
- [Archivo por lotes de Windows - Cambiar versiones de Java 💻🔧](#archivo-por-lotes-de-windows---cambiar-versiones-de-java-)
- [Archivo por lotes de Windows - Ver todas las redes Wi-Fi guardadas y su contraseña 💻](#archivo-por-lotes-de-windows---ver-todas-las-redes-wi-fi-guardadas-y-su-contraseña-)
- [Linux (Bash) - Obtener todos los enlaces magnet de una página web 🧲](#linux-bash---obtener-todos-los-enlaces-magnet-de-una-página-web-)
- [Linux (Bash) - Obtener todos los enlaces a archivos .torrent de una página web 🧲](#linux-bash---obtener-todos-los-enlaces-a-archivos-torrent-de-una-página-web-)
- [Linux (Bash) - Desplegar aplicación con Maven y Spring Boot en contenedor Docker 🚀🐳](#linux-bash---desplegar-aplicación-con-maven-y-spring-boot-en-contenedor-docker)
- [Linux (Bash) - Descargar imágenes desde JSON (local o de Internet) 🖼️](#linux-bash---descargar-imágenes-desde-json-local-o-de-internet-)
- [Linux (Bash) - Convertir imágenes JPG/PNG a WebP 📸➡️🕸️](#linux-bash---convertir-imágenes-jpgpng-a-webp)

## Macro VBA - Crear árbol de carpetas por materia, con fechas de clases 📚👩‍🏫
📼 [Miralo funcionando ahora en YouTube](https://www.youtube.com/watch?v=DcRMCIBKNqY)

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
## Powershell/Bash - Descargar ROMs para emuladores de juego
📼 [Miralo funcionando ahora en YouTube](https://www.youtube.com/watch?v=XXfHq_7UUeE)

El script permite descargar de forma masiva desde Retrostic todas las ROMs disponibles para la consola que se pase como parámetro, en la página que se pase como parámetro.
Almacena las ROMs descargadas en la carpeta de Descargas de Windows, generando una nueva carpeta con el nombre de la consola (o sobreescribiendo la que ya exista).
El siguiente ejemplo descarga todos los juegos de Sega Genesis en una carpeta de nombre "megadrive" dentro de la carpeta "Descargas"
```
.\bajarjuegos.ps1 -consola "megadrive" -pagina 1
```
![image](https://github.com/user-attachments/assets/2959286e-a759-4c3e-82f5-db73ab30c7b3)

El script descargaría todos los juegos que se encuentran en la primera página:

![image](https://github.com/user-attachments/assets/53a5d641-8314-4d56-9130-580a755f33ed)

Busco los archivos en la carpeta Descargas:

![image](https://github.com/user-attachments/assets/7242d490-aef9-4a81-9c39-e153adbb5c13)

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

### Versión del script para Linux (Bash) 🐧
Si usás un sistema Linux, podés descargar el archivo bajarjuegos.sh
Siguiendo el ejemplo que descarga todos los juegos de Sega Genesis en una carpeta de nombre "megadrive", para poder ejecutarlo en Linux, primero deberías descargarte el archivo y darle permisos de ejecución.
Suponiendo que almacenamos bajarjuegos.sh en la carpeta de Descargas de nuestro home:

```
$ chmod +x ~/Descargas/bajarjuegos.sh 
```

Luego ya podemos correrlo:

```
~/Descargas/bajarjuegos.sh -consola "megadrive" -pagina 1
```

## Archivo por lotes de Windows - Cambiar versiones de Java 💻🔧
Este .bat permite intercambiar la versión actual de Java en el sistema de forma global y automática.

⚠ El archivo cambia la variable de entorno JAVA_HOME en el sistema de forma global. Asegúrate de modificar las rutas donde se encuentran tus versiones de Java. Si no lo haces, el archivo no funcionará.

⚠ Asegúrate de ejecutarlo con permisos de administrador.

⚠ Es posible que si tienes otra versión configurada en tus variables de entorno, la herramienta no funcione correctamente. En ese caso, puedes eliminar la variable de entorno JAVA_HOME y volver a ejecutar el archivo.

### Modo de uso
1. Copia el archivo .bat a una carpeta de tu PC.
2. Abre la consola de comandos y ejecuta el archivo "cambiarVersionJava.bat".
3. Selecciona la versión de Java que deseas instalar.
4. El archivo cambia la variable de entorno JAVA_HOME en el sistema de forma global.
5. Se instala la nueva versión de Java en el sistema. ¡Todo listo!
6. Para verificar el cambio, una vez que se haya ejecutado el archivo .bat, abre otra consola de comandos y ejecuta el comando "java -version", o ejecuta el script nuevamente (ya que indica cuál es tu versión de Java activada al inicio).
7. Si deseas cambiar de nuevo la versión de Java, simplemente vuelve a ejecutar el archivo .bat.

## Archivo por lotes de Windows - Ver todas las redes Wi-Fi guardadas y su contraseña 💻
Con este .bat podemos ver las contraseñas de todas las redes Wi-Fi almacenadas en el equipo.

⚠ Solamente funcionará si lo ejecutamos con privilegios de <b>Administrador</b>.

Simplemente hacemos clic con el botón derecho en el archivo .bat y seleccionamos "Ejecutar como Administrador". Nos va a devolver algo como lo siguiente:

![redes-wifi](https://github.com/user-attachments/assets/acbd8211-8c06-4092-845c-4699f16aeaa9)

Para cerrar la ventana, presionamos cualquier tecla.

## Linux (Bash) - Obtener todos los enlaces magnet de una página web 🧲
Lista en pantalla todos los enlaces magnet presentes en una página web, e informa la cantidad de resultados encontrados.

⚠ Para poder ejecutarlo, recordar que es necesario primero darle permisos de ejecución.

```
$ chmod +x ~/Descargas/getMagnetLinks.sh 
```

Luego ya podemos correrlo:

```
$ ./getMagnetLinks.sh https://linuxmint.com/edition.php?id=319
```

![image](https://github.com/user-attachments/assets/58b61e02-2207-46c0-b189-657ca13a2147)


## Linux (Bash) - Obtener todos los enlaces a archivos .torrent de una página web 🧲
Similar al script anterior, lista en pantalla todos los enlaces a archivos .torrent presentes en una página web, e informa la cantidad de resultados encontrados.

⚠ Para poder ejecutarlo, recordar que es necesario primero darle permisos de ejecución.

```
$ chmod +x ~/Descargas/getTorrentsLinks.sh 
```

Luego ya podemos correrlo:

```
$ ./getTorrentsLinks.sh https://www18.dontorrent.link/serie/42511/42512/This-is-Us-1-Temporada
```

![image](https://github.com/user-attachments/assets/c6dfbe8a-1a37-41a6-bca0-c770658bdf84)

## Linux (Bash) - Desplegar aplicación con Maven y Spring Boot en contenedor Docker
Este script permite desplegar una aplicación hecha con Spring Boot en un contenedor Docker remoto (por ejemplo, en un servidor casero). 

⚠️ **Requisitos previos**:
- Tener instalado **Maven** y **Java 21** en el equipo local.
- Contar con permisos SSH y credenciales válidas en el equipo remoto.
- Haber otorgado permisos de ejecución al script: `chmod +x deploy_java.sh`.

Si ya existe un contenedor con el mismo nombre, el script:
1. Lo detiene y elimina automáticamente.
2. Sube el nuevo JAR al servidor.
3. Ejecuta el contenedor nuevamente con la versión actualizada.
---

### 📥 Parámetros del script

|Parámetro|Descripción|Valor de ejemplo|
|------|-------|-------|
|PROJECT_DIR|Directorio donde almacenamos el proyecto|/home/mmontaldo/miproyecto/|
|JAR_NAME|Nombre del JAR|miproyecto-0.0.1-SNAPSHOT.jar|
|REMOTE_USER|Usuario del equipo remoto (Docker)|mmontaldo|
|REMOTE_HOST|IP del Host remoto (Docker)|192.168.0.8|
|REMOTE_DIR|Directorio donde vamos a copiar el JAR|/miapp/|
|REMOTE_PORT|Puerto en el cual se va a exponer la aplicación|5000|
|CONTAINER_NAME|Nombre que tendrá el contenedor Docker|miapp|
|SPRING_PROFILE|Profile de Spring Boot con el cual vamos a ejecutar la aplicación (dev, test, prod), útil para desplegar en cualquiera de los ambientes|dev|

---

### 🧪 Ejemplo de uso

```bash
bash deploy_java.sh \
  /home/mmontaldo/miproyecto \
  miproyecto-0.0.1-SNAPSHOT.jar \
  mmontaldo \
  192.168.0.8 \
  /miapp \
  5000 \
  miapp \
  dev
```

## Linux (Bash) - Descargar imágenes desde JSON (local o de Internet)
Este script lo uso para descargar las miniaturas de Retro Achievements en mi proyecto de Talento Games.

Aquí se puede ver el script en funcionamiento, copiando las imágenes en la carpeta /public/images/icons/consoles del proyecto:
![downloadIcons](https://github.com/user-attachments/assets/8acadc38-ab8c-47f9-83cc-e2b5d2cdfad8)


⚠️ **Requisitos previos**:
- Tener instalado jq
- Tener instalado curl
- Darle permisos de ejecución al script chmod +x

### 📥 Parámetros del script
```bash
./downloadIcons.sh https://retroachievements.org/API/API_GetConsoleIDs.php?y=MIAPIKEY ~/Documentos/Desarrollo/respawn-party/public/images/icons/consoles
```

|Parámetro|Descripción|Valor de ejemplo|
|------|-------|-------|
|Ubicacion_JSON|Ubicación del archivo JSON (puede ser localmente o una URL)|https://retroachievements.org/API/API_GetConsoleIDs.php?y=MIAPIKEY|
|Directorio_Destino|Directorio donde se van a almacenar las imágenes. En mi caso, crea el directorio consoles dentro de mi proyecto web.|

### 🧪 Ejemplo de uso
```bash
$ ./downloadIcons.sh https://retroachievements.org/API/API_GetConsoleIDs.php?y=MI_APKIKEY ~/Documentos/Desarrollo-2/respawn-party/public/images/icons/consoles
$ ./descargar_icons.sh https://tuapi.com/consoles.json ./icons
$ ./descargar_icons.sh file://$(pwd)/consoles.json ./icons # Archivo almacenado localmente


## Linux (Bash) - Convertir imágenes JPG/PNG a WebP
Este script permite convertir todas las imágenes ```.jpg```, ```.jpeg``` y ```.png``` ubicadas dentro de la carpeta ```public/images/``` de tu proyecto a formato .webp, que ofrece mejor compresión sin perder calidad visible.

Es especialmente útil para proyectos web donde optimizar el peso de las imágenes mejora el rendimiento y la experiencia del usuario.

# 📦 Requisitos
Debe estar instalado el paquete ```webp```, que incluye la herramienta ```cwebp```:

```bash
sudo apt install webp
```

🛠️ Modo de uso
Dale permisos de ejecución al script:

```bash
chmod +x convert2Webp.sh
```

Ejecutalo pasando como parámetro la ruta base del proyecto donde se encuentra la carpeta public/images:

```bash
./convert2Webp.sh ./ruta/a/tu/proyecto
```

📁 Por ejemplo, si la estructura es:

```
/mis-proyectos/
└── mi-web/
    └── public/
        └── images/
            ├── foto1.jpg
            ├── foto2.png
            └── fondo.jpeg
```

Entonces deberías ejecutar:

```
./convert2Webp.sh ./mis-proyectos/mi-web
```

🔁 El script convertirá automáticamente las imágenes encontradas y generará sus versiones .webp en el mismo directorio, manteniendo los originales.

⚙️ Personalización
El nivel de calidad de conversión está preconfigurado al 80%, pero podés modificarlo editando esta línea del script:

```bash
QUALITY=80
```

💡 Si querés que el script elimine las imágenes originales luego de convertirlas, podés agregar esta línea justo después del comando de conversión:

```bash
rm "$file"

