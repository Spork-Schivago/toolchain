#!/bin/sh
# check-flex.sh by Dan Peori (dan.peori@oopo.net)

## Check for flex.
flex --version 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
					echo -n >&2 ", flex";
				else
					echo -n >&2 "Please install flex";
					depends_not_met=1;
				fi; }
