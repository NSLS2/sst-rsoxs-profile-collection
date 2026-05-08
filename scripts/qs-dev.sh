#!/usr/bin/bash
set -e
set -o xtrace

pip install -e /home/xf07id1/collection_packages/sst-base

$(dirname "$0")/qs-start.sh