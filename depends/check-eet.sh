#!/bin/sh
command -v eet >/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
					echo -n >&2 ", eet";
				else
					echo -n >&2 "Please install eet";
					depends_not_met=1;
				fi; }
