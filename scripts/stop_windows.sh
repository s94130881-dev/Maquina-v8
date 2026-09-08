#!/usr/bin/env bash

CONTAINER_NAME="maquina-v8-windows"

echo "Parando Windows..."

docker stop "$CONTAINER_NAME" 2>/dev/null || true

echo "✅ Windows parado."
