#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$BASE_DIR/config/windows.env"

mkdir -p "$BASE_DIR/windows"

echo "======================================"
echo "      INICIANDO WINDOWS"
echo "======================================"

docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

docker run -d \
    --name "$CONTAINER_NAME" \
    --restart unless-stopped \
    --device=/dev/kvm \
    --device=/dev/net/tun \
    --cap-add NET_ADMIN \
    -e "VERSION=$WINDOWS_VERSION" \
    -e "RAM_SIZE=$WINDOWS_RAM" \
    -e "CPU_CORES=$WINDOWS_CPU" \
    -e "DISK_SIZE=$WINDOWS_DISK" \
    -e "USERNAME=$WINDOWS_USER" \
    -e "PASSWORD=$WINDOWS_PASSWORD" \
    -p "$WEB_PORT:8006" \
    -p "$RDP_PORT:3389/tcp" \
    -p "$RDP_PORT:3389/udp" \
    -v "$BASE_DIR/windows:/storage" \
    docker.io/dockurr/windows

echo
echo "✅ Windows iniciado"
echo
echo "Web viewer : http://127.0.0.1:$WEB_PORT"
echo "RDP        : :$RDP_PORT"
echo
echo "Usuário: $WINDOWS_USER"
echo "Senha:   configurada em config/windows.env"
