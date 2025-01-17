#!/bin/bash

# Sintaxis: ./bajarjuegos.sh consola pagina
# Ejemplo: ./bajarjuegos.sh megadrive 1

if [ $# -lt 1 ]; then
    echo "Uso: $0 <consola> <pagina>"
    exit 1
fi

consola=$1
pagina=${2:-1}  # Página por defecto es 1 si no se especifica

carpetaDescargas="$HOME/Descargas/$consola"
mkdir -p "$carpetaDescargas"

url="https://www.retrostic.com/es/roms/$consola/page/$pagina"
game_html=$(curl -s "$url")

game_names=$(echo "$game_html" | grep -oP '(?<=<span itemprop="name">).*?(?=</span>)' | tail -n +4)

contadorarchivos=0

# Descargar las ROMs
while IFS= read -r name; do
    encoded_name=$(echo "$name.zip" | jq -sRr @uri)

    download_url="https://downloads.retrostic.com/roms/$consola/$encoded_name"

    dest="$carpetaDescargas/$name.zip"

    echo "Descargando $dest"
    if curl -s --fail -o "$dest" "$download_url"; then
        let "contadorarchivos++"
    else
        echo "Error al intentar descargar $name.zip o archivo no encontrado"
    fi
done <<< "$game_names"

echo "$contadorarchivos archivos fueron descargados en $carpetaDescargas"
