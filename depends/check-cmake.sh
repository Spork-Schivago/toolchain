#!/bin/sh
# check-cmake.sh by Spork Schivago

cmake --version 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
						echo -n >&2 ", cmake";
					else
						echo -n >&2 "Please install cmake";
						depends_not_met=1;
					fi; }
