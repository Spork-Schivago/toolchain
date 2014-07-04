#!/bin/sh
# check-ncurses.sh by Dan Peori (dan.peori@oopo.net)

( ls /usr/include/ncurses.h || ls /usr/include/ncurses/ncurses.h || ls /opt/local/include/ncurses.h || ls /usr/include/curses.h || ls /mingw/include/curses.h) 1>/dev/null 2>&1 || { 
if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", ncurses";
else
	echo -n "Please install ncurses";
	depends_not_met=1;
fi; }
