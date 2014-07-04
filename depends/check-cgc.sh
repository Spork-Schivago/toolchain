#!/bin/sh
# check-cgc.sh by Spork Schivago (SporkSchivago@gmail.com)

## Check for cgc
type cgc 1>/dev/null 2>&1|| { if [ ${depends_not_met} -eq 1 ]; then
					echo -n >&2 ", C for Graphics (cg or cgc)";
				else
					echo -n >&2 "Please install C for Graphics (cg or cgc)";
					depends_not_met=1;
				fi; }
