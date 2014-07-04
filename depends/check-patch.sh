#!/bin/sh
# check-patch.sh by Dan Peori (dan.peori@oopo.net)

## Check for patch.
patch -v 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", patch";
else
	echo -n >&2 "Please install patch";
	depends_not_met=1;
fi; }
