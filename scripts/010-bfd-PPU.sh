#!/bin/sh -e
# bfd-PPU.sh by Spork Schivago (Spork@stny.rr.com)

BINUTILS="binutils-2.23.2"
BFD="BFD"

if [ -d ${BINUTILS}/build-ppu/${BFD}-PPU ]; then
	rm -rf ${BINUTILS}/build-ppu/${BFD}-PPU;
fi

mkdir ${BINUTILS}/build-ppu/${BFD}-PPU

## Patch the source code if a patch file exists.
if [ -f ../patches/${BFD}-PPU.patch ]; then
	echo "Patching ${BFD}"
	cat ../patches/${BFD}-PPU.patch | patch -p1 -d ${BINUTILS}/${BFD}
fi

## Enter the build directory.
cd ${BINUTILS}/build-ppu/${BFD}-PPU

## Configure BFD for PPU
../../bfd/configure \
--cache-file=./config.cache --with-gnu-as --with-gnu-ld --with-system-zlib \
--prefix=/usr/local/ps3dev/ppu --disable-nls --disable-shared --disable-debug \
--disable-dependency-tracking --disable-werror --enable-64-bit-bfd \
--program-transform-name=s\&^\&powerpc64-ps3-elf-\& --disable-option-checking \
--host=powerpc64-ps3-elf --target=powerpc64-ps3-elf --srcdir=../../bfd

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install

