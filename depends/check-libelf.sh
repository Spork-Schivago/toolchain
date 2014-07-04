#!/bin/sh
# check-libelf.sh by Dan Peori (dan.peori@oopo.net)

( ls /usr/include/libelf.h || ls /usr/local/include/libelf.h || ls /opt/local/include/libelf.h ) 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", libelf";
else
	echo -n >&2 "Please install libelf";
	depends_not_met=1;
fi;}
