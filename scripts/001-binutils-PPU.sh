#!/bin/sh -e
# binutils-PPU.sh by Dan Peori (dan.peori@oopo.net)

BINUTILS="binutils-2.23.2"

  ## Download the source code.
  if [ ! -f ${BINUTILS}.tar.bz2 ]; then wget --continue ftp://ftp.gnu.org/gnu/binutils/${BINUTILS}.tar.bz2; fi

  ## Remove the directory if it exists
  if [ -d ${BINUTILS} ]; then
    rm -Rf ${BINUTILS}
  fi

  ## Unpack the source code.
  tar -xvjf ${BINUTILS}.tar.bz2

  ## Patch the source code if a patch file exists.
  if [ -f ../patches/${BINUTILS}-PS3.patch ]; then
    echo "Patching ${BINUTILS}"
    cat ../patches/${BINUTILS}-PS3.patch | patch -p1 -d ${BINUTILS}
  fi

if [ ! -d ${BINUTILS}/build-ppu ]; then

  ## Create the build directory.
  mkdir ${BINUTILS}/build-ppu

fi

## Enter the build directory.
cd ${BINUTILS}/build-ppu

## Configure the build.
../configure --prefix="$PS3DEV/ppu" --target="powerpc64-ps3-elf" \
    --disable-nls \
    --disable-shared \
    --disable-debug \
    --disable-dependency-tracking \
    --disable-werror \
    --enable-64-bit-bfd \
    --with-gcc \
    --with-gnu-as \
    --with-gnu-ld

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install
