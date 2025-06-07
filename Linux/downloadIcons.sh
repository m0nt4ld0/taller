#!/bin/bash

# Verificar que se pasaron los parámetros necesarios
if [ $# -ne 2 ]; then
  echo "Uso: $0 <API_URL> <DEST_DIR>"
  echo "Ejemplo: $0 https://tuapi.com/consoles.json ./icons"
  exit 1
fi

API_URL="$1"
DEST_DIR="$2"

# Crear carpeta de destino si no existe
mkdir -p "$DEST_DIR"

# Archivo temporal para el JSON
TMP_JSON="consoles.json"

# Descargar JSON desde la URL proporcionada
echo "Descargando lista de consolas desde $API_URL..."
curl -s "$API_URL" -o "$TMP_JSON"

# Verificar que se descargó correctamente
if [ ! -s "$TMP_JSON" ]; then
  echo "Error: No se pudo descargar el JSON desde la URL proporcionada."
  exit 1
fi

# Procesar cada consola
echo "Procesando íconos..."

jq -c '.[]' "$TMP_JSON" | while read -r console; do
  name=$(echo "$console" | jq -r '.Name' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -dc 'a-z0-9_')
  icon_url=$(echo "$console" | jq -r '.IconURL')

  if [[ -n "$name" && "$icon_url" != "null" ]]; then
    filename=$(basename "$(echo "$console" | jq -r '.IconURL')")
    filepath="${DEST_DIR}/${filename}"
    echo "Descargando ${name}..."
    curl -s "$icon_url" -o "$filepath"
  fi
done

# Eliminar archivo temporal
rm "$TMP_JSON"

echo "¡Listo! Íconos descargados en ${DEST_DIR}/"

