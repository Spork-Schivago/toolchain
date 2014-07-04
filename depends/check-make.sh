#!/bin/sh
# check-make.sh by Dan Peori (dan.peori@oopo.net)

## Check for make.
${MAKE:-make} -v 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", make";
else
	echo -n >&2 "Please install make";
	depends_not_met=1;
fi; }
