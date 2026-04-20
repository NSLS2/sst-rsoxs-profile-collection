#!/usr/bin/bash
set -e
set -o xtrace
pip install git+https://github.com/cjtitus/caproto.git@no_macros
nbs-sim --startup-dir /home/xf07id1/.ipython/profile_collection/startup --list-pvs