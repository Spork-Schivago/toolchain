#!/bin/sh
# check-gmp.sh by Timothy Redaelli (timothy@redaelli.eu)

[ -f /usr/include/gmp.h -o -f /usr/include/x86_64-linux-gnu/gmp.h -o -f /opt/local/include/gmp.h -o -f /usr/local/include/gmp.h -o -f /opt/csw/include/gmp.h ] || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", gmp-devel";
else
	echo -n >&2 "Please install gmp-devel";
	depends_not_met=1;
fi; }
