#!/bin/bash

# Sintaxis: ./getMagnetLinks.sh urlPagina
# Ejemplo: ./getMagnetLinks.sh https://solotorrent.org/series/yellowstone/

if [ $# -lt 1 ]; then
    echo "Uso: $0 <url_pagina>"
    exit 1
fi

url="$1"

magnet_links=$(wget -qO- "$url" | grep -oP 'magnet:\?xt=urn:btih:[a-zA-Z0-9]+')

matches=$(echo "$magnet_links" | wc -l)

if [ "$matches" -gt 0 ]; then
    echo "La búsqueda obtuvo $matches resultados"
else
    echo "No se encontraron enlaces magnet."
fi

echo "$magnet_links" | while read -r link; do
    echo "$link"
done
