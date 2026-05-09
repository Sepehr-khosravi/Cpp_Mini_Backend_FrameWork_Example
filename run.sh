#!/bin/bash
clear

./build.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"

export SERVER_PATH="${PROJECT_ROOT}/build/run"

echo "Making server executable..."
chmod +x "${SERVER_PATH}"

echo "Compiling health monitor..."
cd "${PROJECT_ROOT}/external/core/health"

g++ \
    health.cpp \
    address.cpp \
    -o health_monitor

echo "Starting health monitor..."
./health_monitor
