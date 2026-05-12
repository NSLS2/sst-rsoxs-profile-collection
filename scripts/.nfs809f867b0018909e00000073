#!/usr/bin/bash
set -e
set -o xtrace
pip install -e /home/xf07id1/collection_packages/rsoxs

start-re-manager --redis-addr ${QS_REDIS_ADDR:-localhost}:6379 --zmq-publish-console ON --use-ipython-kernel ON --ipython-kernel-ip auto --startup-profile collection
