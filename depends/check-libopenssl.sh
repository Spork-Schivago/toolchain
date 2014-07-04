#!/bin/sh
# check-libopenssl.sh by Spork Schivago (SporkSchivago@gmail.com)

( ls /usr/include/openssl/ || ls /usr/local/include/openssl || ls /opt/local/include/openssl ) 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", libopenssl-devel";
else
	echo -n >&2 "Please install libopenssl-devel";
	depends_not_met=1;
fi; }
