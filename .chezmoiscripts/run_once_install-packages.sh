#!/bin/bash
set -euo pipefail

# Use sudo if available and not root
SUDO=""
if [ "$(id -u)" -ne 0 ] && command -v sudo &> /dev/null; then
    SUDO="sudo"
fi

AGE_VERSION="1.3.1"

# Detect OS
if [ -f /etc/debian_version ]; then
    $SUDO apt-get update -y
    $SUDO apt-get upgrade -y
    $SUDO apt-get install -y \
        zsh
    curl -LO "https://github.com/FiloSottile/age/releases/download/v${AGE_VERSION}/age-v${AGE_VERSION}-linux-amd64.tar.gz"
    tar xzf "age-v${AGE_VERSION}-linux-amd64.tar.gz"
    $SUDO mv age/age age/age-keygen /usr/local/bin/
    rm -rf age "age-v${AGE_VERSION}-linux-amd64.tar.gz"
fi

