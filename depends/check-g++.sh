#!/bin/sh
# check-g++.sh by Spork Schivago (SporkSchivago@gmail.com)

## Check for g++.
g++ --version 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
					echo -n >&2 ", g++";
				else
					echo -n >&2 "Please install g++";
					depends_not_met=1;
				fi; }
