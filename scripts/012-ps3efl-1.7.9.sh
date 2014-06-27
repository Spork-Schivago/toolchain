#!/bin/sh -e
# ps3efl.sh by (By Spork Schivago)

PS3EFL="PS3EFL"

## Download the source code from our repository
git clone https://github.com/Spork-Schivago/${PS3EFL}

## Change to the build directory.
cd ${PS3EFL}

## Compile and install.
./ps3efl.sh
