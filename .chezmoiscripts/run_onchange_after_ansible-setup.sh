#!/bin/bash
# playbook.yml hash: {{ include "ansible/playbook.yml" | sha256sum }}
set -euo pipefail

ansible-playbook --connection=local --inventory 127.0.0.1, \
    "${CHEZMOI_SOURCE_DIR}/ansible/playbook.yml"
