#!/bin/sh -e
# ps3efl.sh by (By Spork Schivago)

PS3EFL="ps3efl"

## Check for the source code in the previous directory
## because we have no place to host it {:-(
if [ ! -f ../${PS3EFL}.tar.xz ]; then
  echo "This distribution must have the ${PS3EFL}.tar.xz file in the root directory of the toolchain...";
  exit 1
else
## We found our archive, move it to the build directory.
  cp ../${PS3EFL}.tar.xz .
fi


## Unpack the source code.
rm -Rf ${PS3EFL} && tar -xvJf ${PS3EFL}.tar.xz

## Create the build directory.
cd ${PS3EFL}

## Compile and install.
./ps3efl.sh
