#!/bin/sh
# check-python.sh by Dan Peori (dan.peori@oopo.net)

pyprefix=0
python_dev=0;


## Check for python.
( python --version || python -V ) 1>/dev/null 2>&1 || { 

if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", python";
else
	echo -n >&2 "Please install python";
	depends_not_met=1;
fi; }



## Check for python-config
which python-config 1>/dev/null 2>&1 && pyprefix=$(python-config --prefix)
[ $? -eq 0 ] || { 

if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", python-dev";
	python_dev=1;
else
	echo -n >&2 "Please install python-dev";
	python_dev=1;
	depends_not_met=1;
fi; }



## Check for python header files
( ls -1d "${pyprefix}"/include/python2.*/Python.h || ls -1d /opt/local/include/python2.*/Python.h ) 1>/dev/null 2>&1 || [ -f "$PYINSTALLDIR/include/Python.h" ] || { 

if [ ${depends_not_met} -eq 1 ]; then
	if [ ${python_dev} -eq 0 ]; then
		echo -n >&2 ", python-dev";
	fi;
else
	if [ ${python_dev} -eq 0 ]; then
		echo -n >&2 "Please install python-dev";
		depends_not_met=1;
	fi;
fi; }

## Check for python-libxml2 module
python -c "import libxml2; print [x for x in dir(libxml2)]" 1>/dev/null 2>&1 || { 

if [ ${depends_not_met} -eq 1 ]; then
	echo -n >&2 ", the libxml2 python module";
else
	echo -n >&2 "Please install the libxml2 python module";
	depends_not_met=1;
fi; }
