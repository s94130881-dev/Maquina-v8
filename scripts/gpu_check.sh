#!/usr/bin/env bash

echo "=========================================="
echo "       MAQUINA-V8 - GPU CHECK"
echo "=========================================="

if command -v nvidia-smi >/dev/null 2>&1; then

    echo
    echo "NVIDIA GPU detectada."
    echo

    nvidia-smi --query-gpu=name,memory.total,driver_version \
        --format=csv

    echo
    echo "MODO: GPU"

else

    echo
    echo "NVIDIA GPU não detectada."
    echo
    echo "MODO: CPU"

fi

echo
