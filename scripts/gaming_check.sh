#!/usr/bin/env bash

echo "=========================================="
echo "       MAQUINA-V8 GAMING CHECK"
echo "=========================================="

echo
echo "GPU:"

if command -v nvidia-smi >/dev/null 2>&1; then

    nvidia-smi \
        --query-gpu=name,memory.total,driver_version \
        --format=csv

    echo
    echo "GPU NVIDIA detectada."
    echo "Encoder esperado: NVENC"

else

    echo "NVIDIA não encontrada."
    echo "Encoder: software/CPU"

fi

echo
echo "Sunshine:"

if command -v sunshine >/dev/null 2>&1; then
    echo "INSTALADO"
    sunshine --version || true
else
    echo "NÃO INSTALADO"
fi

echo
