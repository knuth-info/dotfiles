#!/bin/bash
set -euo pipefail

# Use sudo if available and not root
SUDO=""
if [ "$(id -u)" -ne 0 ] && command -v sudo &> /dev/null; then
    SUDO="sudo"
fi

# Detect OS
if [ -f /etc/debian_version ]; then
    $SUDO apt-get update -y
    $SUDO apt-get upgrade -y
    $SUDO apt-get install -y \
        zsh \
        age
fi
