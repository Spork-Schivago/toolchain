#!/bin/sh
# check-makeinfo.sh by Dan Peori (dan.peori@oopo.net)

## Check for makeinfo.
makeinfo --version 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", makeinfo";
else
	echo -n >&2 "Please install makeinfo";
	depends_not_met=1;
fi; }
