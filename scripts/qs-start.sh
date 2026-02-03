#!/usr/bin/bash
set -e
set -o xtrace
start-re-manager --zmq-publish-console ON --use-ipython-kernel ON --ipython-kernel-ip auto --startup-profile collection
