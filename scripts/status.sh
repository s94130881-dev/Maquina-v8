#!/usr/bin/env bash

CONTAINER_NAME="maquina-v8-windows"

echo "======================================"
echo "       STATUS MAQUINA-V8"
echo "======================================"

if docker ps --format '{{.Names}}' | grep -qx "$CONTAINER_NAME"; then
    echo "✅ Windows: ONLINE"
else
    echo "❌ Windows: OFFLINE"
fi

echo
echo "Containers:"
docker ps --filter "name=$CONTAINER_NAME"

echo
echo "Porta RDP:"
ss -ltn 2>/dev/null | grep ':3389' || echo "❌ 3389 não está escutando"
