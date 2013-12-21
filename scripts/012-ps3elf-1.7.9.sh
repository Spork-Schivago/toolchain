#!/bin/sh -e
# ps3elf.sh by (By Spork Schivago)

PS3ELF="ps3elf"

## Check for the source code in the previous directory
## because we have no place to host it {:-(
if [ ! -f ../${PS3ELF}.tar.xz ]; then
  echo "This distribution must have the ${PS3ELF}.tar.xz file in the root directory of the toolchain...";
  exit 1
else
## We found our archive, move it to the build directory.
  cp ../${PS3ELF}.tar.xz .
fi


## Unpack the source code.
rm -Rf ${PS3ELF} && tar -xvJf ${PS3ELF}.tar.xz

## Create the build directory.
cd ${PS3ELF}

## Compile and install.
./ps3elf.sh
