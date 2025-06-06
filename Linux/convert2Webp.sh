#!/bin/bash

# Validar parámetro
if [ -z "$1" ]; then
  echo "❌ Error: Falta la ruta base del proyecto."
  echo "👉 Ejemplo: ./convert2Webp.sh ./mi-proyecto"
  exit 1
fi

# Ruta base pasada como argumento
BASE_PATH="$1"
INPUT_DIR="$BASE_PATH/public/images"

# Verificar existencia del directorio
if [ ! -d "$INPUT_DIR" ]; then
  echo "❌ Error: No se encontró el directorio $INPUT_DIR"
  exit 1
fi

# Calidad de conversión
QUALITY=80

echo "🛠️ Convirtiendo imágenes a WebP en: $INPUT_DIR"

# Buscar y convertir imágenes
find "$INPUT_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r file; do
  output="${file%.*}.webp"
  echo "➡️  $file → $output"
  cwebp -q "$QUALITY" "$file" -o "$output"
done

echo "✅ Conversión finalizada correctamente."
