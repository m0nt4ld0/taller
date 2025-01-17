#!/bin/bash

# Sintaxis: ./bajarjuegos.sh consola pagina
# Ejemplo: ./bajarjuegos.sh megadrive 1

# Verificar si se han pasado los parámetros necesarios
if [ $# -lt 1 ]; then
    echo "Uso: $0 <consola> <pagina>"
    exit 1
fi

consola=$1
pagina=${2:-1}  # Página por defecto es 1 si no se especifica

# Crear la carpeta para la consola en el directorio de descargas
carpetaDescargas="$HOME/Descargas/$consola"
mkdir -p "$carpetaDescargas"

# Obtener el listado de juegos de la página
url="https://www.retrostic.com/es/roms/$consola/page/$pagina"
game_html=$(curl -s "$url")

# Extraer los nombres de los juegos usando grep y sed
game_names=$(echo "$game_html" | grep -oP '(?<=<span itemprop="name">).*?(?=</span>)' | tail -n +4)

# Contador de archivos descargados
contadorarchivos=0

# Descargar las ROMs
for name in $game_names; do
    # Codificar el nombre del juego para la URL
    encoded_name=$(echo "$name.zip" | jq -sRr @uri)

    # URL de descarga
    download_url="https://downloads.retrostic.com/roms/$consola/$encoded_name"

    # Ruta de destino
    dest="$carpetaDescargas/$name.zip"

    # Intentar descargar la ROM
    echo "Descargando $dest"
    if curl -s --fail -o "$dest" "$download_url"; then
        let "contadorarchivos++"
    else
        echo "Error al intentar descargar $name.zip o archivo no encontrado"
    fi
done

echo "$contadorarchivos archivos fueron descargados en $carpetaDescargas"

