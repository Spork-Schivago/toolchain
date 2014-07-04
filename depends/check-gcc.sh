#!/bin/sh
# check-gcc.sh by Dan Peori (dan.peori@oopo.net)

## Check for gcc.
gcc --version 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
					echo -n >&2 ", gcc";
				else
					echo -n >&2 "Please install gcc";
					depends_not_met=1;
				fi; }
