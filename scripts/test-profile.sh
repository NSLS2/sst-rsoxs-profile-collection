#!/usr/bin/env bash
set -euo pipefail
set -o xtrace

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
TESTS_DIR="${PROFILE_ROOT}/tests"

export TESTS_DIR
pip install -e /home/xf07id1/collection_packages/rsoxs
ipython --profile collection -c 'import os, sys, pytest, time; time.sleep(10); print(os.environ["TESTS_DIR"]); rc = pytest.main(["-v", os.environ["TESTS_DIR"]]); sys.stdout.flush(); sys.stderr.flush(); os._exit(rc)'
