#!/usr/bin/env bash
set -e

echo "======================================"
echo " Instalando Docker"
echo "======================================"

if command -v docker >/dev/null 2>&1; then
    echo "✅ Docker já instalado"
    docker --version
    exit 0
fi

curl -fsSL https://get.docker.com | sh

sudo systemctl enable docker 2>/dev/null || true
sudo systemctl start docker 2>/dev/null || true

echo
echo "✅ Docker instalado"
docker --version
