#!/bin/sh -e
# psl1ght.sh by Dan Peori (dan.peori@oopo.net)
PSL1GHT_SDK="PSL1GHT"

## Download the source code.
rm -rf ${PSL1GHT_SDK}
git clone https://github.com/Spork-Schivago/${PSL1GHT_SDK}

## Patch the source code if a patch file exists.
if [ -f ../patches/${PSL1GHT_SDK}.patch ]; then
  echo "Patching ${PSL1GHT_SDK}"
  cat ../patches/${PSL1GHT_SDK}.patch | patch -p1 -d ${PSL1GHT_SDK}
fi


## Change to the build directory.
cd ${PSL1GHT_SDK}

## Compile and install.
${MAKE:-make} install-ctrl && ${MAKE:-make} && ${MAKE:-make} install
