#!/usr/bin/bash
set -e
set -o xtrace

pip install -e /home/xf07id1/collection_packages/rsoxs
pip install -e /home/xf07id1/xraygui/nbs-gui
pip install git+https://github.com/cjtitus/bluesky-widgets@worker_weakref
$(dirname "$0")/gui-start.sh