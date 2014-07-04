#!/bin/sh
# check-makedepends.sh by Spork Schivago (SporkSchivago@gmail.com)

## Check for makedepend
type makedepend 1>/dev/null 2>&1|| { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", makedepend";
else
	echo -n >&2 "Please install makedepend";
	depends_not_met=1;
fi; }
