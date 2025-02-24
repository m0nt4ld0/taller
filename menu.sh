#!/bin/bash

# Obtener el directorio absoluto donde se encuentra el script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Banner ASCII
clear
echo "======================================="
echo "   BIENVENIDOS AL TALLER DE m0nt4ld0   "
echo "======================================="
echo "               ____        __  __ __  __    ______  "
echo "    ____ ___  / __ \____  / /_/ // / / /___/ / __ \ "
echo "   / __ \`__ \/ / / / __ \/ __/ // /_/ / __  / / / / "
echo "  / / / / / / /_/ / / / / /_/__  __/ / /_/ / /_/ /  "
echo " /_/ /_/ /_/\____/_/ /_/\__/  /_/ /_/\__,_/\____/   "
echo "                                                   "
echo "github.com/m0nt4ld0"

while true; do
    echo ""
    echo "1) Detectar enlaces magnet en una pagina web"
    echo "2) Detectar archivos .torrent en una pagina web"
    echo "3) Bajar Juegos de Retrostic.com"
    echo "0) Salir"
    echo -n "Seleccione una opción: "
    read -r opcion

    case $opcion in
        1)
            echo "Ingrese la URL de la página donde desea detectar Magnet Links: "
            read -r enlace
            echo "Detectando enlaces magnet en la página web $enlace..."
            bash "$SCRIPT_DIR/Linux/getMagnetLinks.sh" "$enlace"
            ;;
        2)
            echo "Ingrese la URL de la página donde desea detectar archivos Torrent: "
            read -r url
            echo "Detectando archivos .torrent en la página $url..."
            bash "$SCRIPT_DIR/Linux/getTorrentsLinks.sh" "$url"
            ;;
        3)
            echo "Ingrese la consola seguida por un espacio y el número de página para bajar juegos de Retrostic: "
            read -r consola pagina
            echo "Descargando juegos para la consola $consola en la página $pagina..."
            SCRIPT_DIR="$(dirname "$(realpath "$0")")"
            PYTHON_SCRIPT="$SCRIPT_DIR/Linux/bajarjuegos.py"
            python3 "$PYTHON_SCRIPT" "$consola" "$pagina"
            ;;
        0)
            echo "¡Hasta pronto!"
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
done

