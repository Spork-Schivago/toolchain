#!/bin/sh
# check-autoconf.sh by Dan Peori (dan.peori@oopo.net)

## Check for autoconf.
autoconf --version 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
						echo -n >&2 ", autoconf";
					else
						echo -n >&2 "Please install autoconf";
						depends_not_met=1;
					fi; }
