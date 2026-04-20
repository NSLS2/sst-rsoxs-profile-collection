#!/usr/bin/bash
set -e
set -o xtrace
pip install git+https://github.com/cjtitus/caproto.git@no_macros
pip install -e /home/xf07id1/collection_packages/nbs-sim
$(dirname "$0")/sim-start.sh