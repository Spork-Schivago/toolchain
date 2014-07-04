#!/bin/sh
# check-libtool.sh by Dan Peori (dan.peori@oopo.net)

## Check for libtool.
{ libtool --version || libtool -V; } 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", libtool";
else
	echo -n >&2 "Please install libtool";
	depends_not_met=1;
fi; }
