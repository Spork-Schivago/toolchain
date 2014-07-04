#!/bin/sh
# check-automake.sh by Dan Peori (dan.peori@oopo.net)

## Check for automake.
automake --version 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
						echo -n >&2 ", automake";
					else
						echo -n >&2 "Please install automake";
						depends_not_met=1;
					fi; }
