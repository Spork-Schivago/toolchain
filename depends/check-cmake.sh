#!/bin/sh
# check-cmake.sh by Spork Schivago

cmake --version 1>/dev/null 2>&1 || { echo "ERROR: Install cmake before continuing."; exit 1; }
