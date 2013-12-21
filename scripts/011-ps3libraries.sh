#!/bin/sh -e
# SDL2_libs.sh by Dan Peori (dan.peori@oopo.net) (Updated by Spork Schivago)

PS3LIBS="ps3libraries"

## Check for the source code in the previous directory
## because we have no place to host it {:-(
if [ ! -f ../${PS3LIBS}.tar.xz ]; then
  echo "This distribution must have the ${PS3LIBS}.tar.xz file in the root directory of the toolchain...";
  exit 1
else
## We found our archive, move it to the build directory.
  cp ../${PS3LIBS}.tar.xz .
fi


## Unpack the source code.
rm -Rf ${PS3LIBS} && tar -xvJf ${PS3LIBS}.tar.xz

## Create the build directory.
cd ${PS3LIBS}

## Compile and install.
./libraries.sh
