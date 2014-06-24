#!/bin/sh
# check-libopenssl.sh by Spork Schivago (SporkSchivago@gmail.com)

( ls /usr/include/openssl/ || ls /usr/local/include/openssl || ls /opt/local/include/openssl ) 1>/dev/null 2>&1 || { echo "ERROR: Install libopenssl-devel before continuing."; exit 1; }
