#!/bin/sh
# check-wget.sh by Dan Peori (dan.peori@oopo.net)

## Check for wget.
wget -V 1>/dev/null 2>&1 || { 

if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", wget";
else
	echo -n >&2 "Please install wget";
	depends_not_met=1;
fi; }
