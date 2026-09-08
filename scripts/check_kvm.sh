#!/usr/bin/env bash
set -e

echo "======================================"
echo "       MAQUINA-V8 WINDOWS"
echo "======================================"

echo
echo "[1] CPU:"
nproc

echo
echo "[2] RAM:"
free -h

echo
echo "[3] KVM:"

if [ -e /dev/kvm ]; then
    echo "✅ /dev/kvm disponível"
    ls -l /dev/kvm
else
    echo "❌ /dev/kvm NÃO está disponível"
    echo
    echo "Windows virtualizado com aceleração KVM não poderá iniciar."
    exit 1
fi

echo
echo "[4] Virtualização:"
grep -E 'vmx|svm' /proc/cpuinfo >/dev/null \
    && echo "✅ CPU suporta virtualização" \
    || echo "⚠️ extensão de virtualização não encontrada"
