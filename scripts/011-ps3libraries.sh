#!/bin/sh -e
# 011-ps3libraries.sh by Spork Schivago (SporkSchivago@gmail.com)

PS3LIBS="PS3Libraries"

## Clone the source code from our github repository
git clone https://github.com/Spork-Schivago/${PS3LIBS}

## Create the build directory.
cd ${PS3LIBS}

## Compile and install.
./libraries.sh
