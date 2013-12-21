#!/bin/sh -e
# psl1ght.sh by Dan Peori (dan.peori@oopo.net)
PSL1GHT_SDK="psl1ght"

## Download the source code.
if [ ! -f ${PSL1GHT_SDK}.tar.gz ]; then
  wget --no-check-certificate https://github.com/ps3dev/${PSL1GHT_SDK}/tarball/master -O ${PSL1GHT_SDK}.tar.gz
fi

## Unpack the source code.
rm -Rf ${PSL1GHT_SDK} && mkdir ${PSL1GHT_SDK} && tar --strip-components=1 --directory=${PSL1GHT_SDK} -xvzf ${PSL1GHT_SDK}.tar.gz

## Create the build directory.
cd ${PSL1GHT_SDK}

## Compile and install.
${MAKE:-make} install-ctrl && ${MAKE:-make} && ${MAKE:-make} install
