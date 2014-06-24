#!/bin/sh
# check-g++.sh by Spork Schivago (SporkSchivago@gmail.com)

## Check for gcc.
g++ --version 1>/dev/null 2>&1 || { echo "ERROR: Install g++ before continuing."; exit 1; }
