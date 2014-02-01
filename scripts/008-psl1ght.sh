#!/bin/sh -e
# psl1ght.sh by Dan Peori (dan.peori@oopo.net)
PSL1GHT_SDK="psl1ght"

## Download the source code.
if [ ! -f ${PSL1GHT_SDK}.tar.gz ]; then
  wget --no-check-certificate https://github.com/ps3dev/${PSL1GHT_SDK}/tarball/master -O ${PSL1GHT_SDK}.tar.gz
fi

## Unpack the source code.
rm -Rf ${PSL1GHT_SDK} && mkdir ${PSL1GHT_SDK} && tar --strip-components=1 --directory=${PSL1GHT_SDK} -zxvf ${PSL1GHT_SDK}.tar.gz

## Patch the source code if a patch file exists.
if [ -f ../patches/${PSL1GHT_SDK}.patch ]; then
  echo "Patching ${PSL1GHT_SDK}"
  cat ../patches/${PSL1GHT_SDK}.patch | patch -p1 -d ${PSL1GHT_SDK}
fi


## Change to the build directory.
cd ${PSL1GHT_SDK}

## Compile and install.
${MAKE:-make} install-ctrl && ${MAKE:-make} && ${MAKE:-make} install
