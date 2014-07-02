#!/bin/sh
# check-makedepends.sh by Spork Schivago (SporkSchivago@gmail.com)

## Check for makedepend
type makedepend 1>/dev/null 2>&1|| { echo "ERROR: Please install package makedepend before continuing"; exit 1; }
