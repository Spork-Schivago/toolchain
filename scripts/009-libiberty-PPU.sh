#!/bin/sh -e
# libiberty-PPU.sh by Spork Schivago (Spork@stny.rr.com)

BINUTILS="binutils-2.23.2"
LIBIBERTY="libiberty"

## Remove the libiberty-PPU directory
rm -rf ${BINUTILS}/build-ppu/${LIBIBERTY}-PPU

## Create the libiberty-PPU directory
mkdir ${BINUTILS}/build-ppu/${LIBIBERTY}-PPU

## Patch the source code if a patch file exists.
if [ -f ../patches/${LIBIBERTY}-PPU.patch ]; then
  echo "Patching ${LIBIBERTY}"
  cat ../patches/${LIBIBERTY}-PPU.patch | patch -p1 -d ${BINUTILS}
fi


## Enter the build directory.
cd ${BINUTILS}/build-ppu/${LIBIBERTY}-PPU

## Configure libiberty for PPU
../../libiberty/configure --cache-file=./config.cache --with-gnu-as \
--enable-install-libiberty --with-gnu-ld --with-system-zlib --prefix="${PS3DEV}/ppu" \
--disable-nls --disable-shared --disable-debug --disable-dependency-tracking \
--disable-werror --enable-64-bit-bfd --with-gcc --with-gnu-as --with-gnu-ld \
--program-transform-name=s\&^\&powerpc64-ps3-elf-\& --disable-option-checking \
--target="powerpc64-ps3-elf" --host="powerpc64-ps3-elf" --srcdir=../../libiberty

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install

