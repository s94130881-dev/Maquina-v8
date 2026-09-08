#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "=========================================="
echo "          MAQUINA-V8 SETUP"
echo "=========================================="

echo
echo "[1/4] Criando pastas..."

mkdir -p \
    scripts \
    config \
    colab \
    system

echo "Pastas criadas."

echo
echo "[2/4] Criando arquivos..."

touch \
    README.md \
    config/machine.conf \
    scripts/install.sh \
    scripts/setup_desktop.sh \
    scripts/setup_xrdp.sh \
    scripts/setup_tailscale.sh \
    scripts/gpu_check.sh \
    scripts/start.sh \
    scripts/stop.sh \
    colab/Maquina-V8.ipynb \
    system/maquina-v8.service

chmod +x scripts/*.sh

echo "Arquivos criados."

echo
echo "[3/4] Verificando GitHub CLI..."

if ! command -v gh >/dev/null 2>&1; then
    echo "GitHub CLI não está instalado."
    echo
    echo "Instale com:"
    echo "pkg install gh -y"
    exit 1
fi

echo
echo "[4/4] Login no GitHub..."
echo
echo "O GitHub fornecerá um endereço HTTPS."
echo "Abra o endereço no navegador e autorize a conta."
echo

gh auth login --hostname github.com --git-protocol https --web

echo
echo "=========================================="
echo "       AUTENTICAÇÃO CONCLUÍDA"
echo "=========================================="

echo
echo "Conta autenticada:"
gh auth status

echo
echo "Estrutura criada:"
find . -maxdepth 3 -type f | sort

echo
echo "=========================================="
echo "          MAQUINA-V8 PRONTO"
echo "=========================================="
