#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

cd -- "${ROOT_DIR}"

if [[ $# -eq 0 ]]; then
  exec podman-compose -f docker-compose.build.yml build
fi

exec podman-compose -f docker-compose.build.yml build "$@"

