#!/bin/sh
# check-pkg-config.sh by Dan Peori (dan.peori@oopo.net)

## Check for pkg-config.
pkg-config --version 1>/dev/null 2>&1 || { 

if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", pkg-config";
else
	echo -n >&2 "Please install pkg-config";
	depends_not_met=1;
fi; }
