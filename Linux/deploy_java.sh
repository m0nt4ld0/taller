#!/bin/bash

# Script para desplegar aplicación Java + SpringBoot en contenedor Docker
# 2025 - Mariela Montaldo (mmontaldo@live.com)
# github.com/m0nt4ld0

# Validación de argumentos
if [ "$#" -ne 8 ]; then
  echo "Uso: $0 <PROJECT_DIR> <JAR_NAME> <REMOTE_USER> <REMOTE_HOST> <REMOTE_DIR> <REMOTE_PORT> <CONTAINER_NAME> <SPRING_PROFILE>"
  exit 1
fi

# Asignar parámetros
PROJECT_DIR=$1
JAR_NAME=$2
REMOTE_USER=$3
REMOTE_HOST=$4
REMOTE_DIR=$5
REMOTE_PORT=$6
CONTAINER_NAME=$7
SPRING_PROFILE=$8

TARGET_DIR="$PROJECT_DIR/target"
JAR_PATH="$TARGET_DIR/$JAR_NAME"

echo "▶ Compilando el proyecto en $PROJECT_DIR..."
cd "$PROJECT_DIR" || { echo "❌ No se encontró la carpeta del proyecto"; exit 1; }

mvn clean package -DskipTests || { echo "❌ Falló la compilación"; exit 1; }

echo "✅ Compilación exitosa."

# Verificar que el JAR se haya generado correctamente
if [ ! -f "$JAR_PATH" ]; then
  echo "❌ El archivo JAR no se encontró en $JAR_PATH"
  exit 1
fi

echo "📦 Subiendo $JAR_NAME al servidor $REMOTE_HOST..."
scp "$JAR_PATH" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/" || { echo "❌ Falló la copia SCP"; exit 1; }

echo "✅ Subida completada."

echo "🛑 Deteniendo contenedor Docker '$CONTAINER_NAME' si existe..."
ssh "$REMOTE_USER@$REMOTE_HOST" << EOF
  docker ps -a --format '{{.Names}}' | grep -w $CONTAINER_NAME > /dev/null
  if [ \$? -eq 0 ]; then
    echo "⏹  Deteniendo contenedor '$CONTAINER_NAME'..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
  else
    echo "ℹ️  No hay contenedor llamado '$CONTAINER_NAME' corriendo."
  fi

  echo "🚀 Ejecutando nuevo contenedor '$CONTAINER_NAME' con perfil '$SPRING_PROFILE' y reinicio automático..."
  cd $REMOTE_DIR
  docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    -v "\$PWD:/app" \
    -p $REMOTE_PORT:$REMOTE_PORT \
    eclipse-temurin:21-jre \
    java -jar /app/$JAR_NAME --spring.profiles.active=$SPRING_PROFILE --server.port=$REMOTE_PORT
EOF

echo "✅ Despliegue completado en $REMOTE_HOST:$REMOTE_PORT con perfil '$SPRING_PROFILE'"

