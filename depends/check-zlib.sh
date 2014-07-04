#!/bin/sh
# check-zlib.sh by Dan Peori (dan.peori@oopo.net)

( ls /usr/include/zlib.h || ls /opt/local/include/zlib.h ) 1>/dev/null 2>&1 || { 

if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 " and zlib";
else
	echo -n "Please install zlib";
	depends_not_met=1;
fi; }
