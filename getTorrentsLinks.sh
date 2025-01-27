#!/bin/bash
# =============================================================
# Nombre del Script: getTorrentsLinks.sh
# Autor: Mariela Montaldo
# Fecha de Creación: 2025-01-27
# Última Modificación: 2025-01-27
# Descripción: 
# Este script detecta enlaces a archivos .torrent en un sitio web y 
# devuelve un listado con todos los archivos detectados.
#
# Uso:
# ./getTorrentsLinks.sh [urlPagina] [argumentos]
#
# Ejemplo:
# ./getTorrentsLinks.sh https://solotorrent.org/series/yellowstone/
#
#
# Versión: 1.0
# =============================================================

if [ $# -lt 1 ]; then
    echo "Uso: $0 <url_pagina>"
    exit 1
fi

url="$1"

links=$(wget -qO- "$url" | grep -oP 'www[^"]*\.torrent')

matches=$(echo "$links" | wc -l)

if [ "$matches" -gt 0 ]; then
    echo "La búsqueda obtuvo $matches resultados"
else
    echo "No se encontraron enlaces torrent."
fi

echo "$links" | while read -r link; do
    if [[ "$link" == https://* ]]; then
        echo "$link"
    else
        echo "https://$link"
    fi
done
