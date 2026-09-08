#!/usr/bin/env bash

set -e

echo "=========================================="
echo "       MAQUINA-V8 - SUNSHINE"
echo "=========================================="

echo
echo "[1/4] Instalando dependências..."

apt-get update -y

apt-get install -y \
    curl \
    wget \
    ca-certificates \
    unzip \
    x11-xserver-utils

echo
echo "[2/4] Adicionando repositório Sunshine..."

curl -1sLf \
'https://dl.cloudsmith.io/public/lizardbyte/stable/cfg/setup/bash.deb.sh' \
| bash

echo
echo "[3/4] Instalando Sunshine..."

apt-get update -y
apt-get install -y sunshine

echo
echo "[4/4] Verificando instalação..."

if command -v sunshine >/dev/null 2>&1; then
    echo
    echo "Sunshine instalado com sucesso."
    sunshine --version || true
else
    echo
    echo "ERRO: Sunshine não foi instalado."
    exit 1
fi

echo
echo "=========================================="
echo "       SUNSHINE INSTALADO"
echo "=========================================="

echo
echo "Interface web:"
echo "https://127.0.0.1:47990"
echo
