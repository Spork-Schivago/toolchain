#!/bin/sh
# check-cgc.sh by Spork Schivago (SporkSchivago@gmail.com)

## Check for cgc
type cgc 1>/dev/null 2>&1|| { echo "ERROR: Please install package C for Graphics (cg or cgc) before continuing"; exit 1; }
