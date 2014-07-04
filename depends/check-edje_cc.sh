#!/bin/sh
command -v edje_cc >/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
						echo -n >&2 ", edje_cc";
					else
						echo -n >&2 "Please install edje_cc";
						depends_not_met=1;
					fi; }
