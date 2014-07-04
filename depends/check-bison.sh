#!/bin/sh
# check-bison.sh by Dan Peori (dan.peori@oopo.net)

( bison -V || yacc -V ) 1>/dev/null 2>&1 || { if [ ${depends_not_met} -eq 1 ]; then
							echo -n >&2 ", bison";
						else
							echo -n >&2 "Please install bison";
							depends_not_met=1;
						fi; }
