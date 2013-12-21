toolchain
=========

This is a beta version of a more up-to-date toolchain for the PS3 which also includes the PS3Libraries (with some additions) and the Enlightenment Foundation Libraries.

It includes the following:

 Toolchain:
 binutils-2.23.2
 gcc-4.8.2
 newlib-2.0.0
 gdb-7.6.1
 psl1ght-v2
 a ppu version of libiberty
 a not working so well ppu version of libbfd
 
 PS3 Libraries:
 zlib-1.2.8
 libpng-1.6.6
 jpeg-v9
 freetype-2.5.0.1
 pixman-0.32.2
 cairo-1.12.16
 libogg-1.3.1
 libvorbis-1.3.3
 libzip-0.11.1
 tiff-4.0.3
 libmikmod-3.3.3
 libxml2-2.9.1
 webp-0.3.1
 flac-1.3.0
 libmad-0.15.1b
 Zeldin's SDL1 for the psl1ght
 updated SDL1 libraries
 SDL2-2.0.1
 SDL2 libraries
 polarssl-1.3.2
 libcurl-7.33.0
 faad2-2.7
 libtheora-1.1.1
 libintl-lite-0.5
 Wargio's NoRSX-0.3.1
 libjson-0.11
 
 EFL Libraries:
 escape
 eina-1.7.9
 eet-1.7.9
 expat-2.1.0
 fontconfig-2.11.0
 evas-1.7.9
 expedite-1.7.9
 c-ares-1.10.0
 ecore-1.7.9
 embryo-1.7.9
 lua-5.2.3
 edje-1.7.9
 chipmunk-6.2.1
 eskiss
 elementary-1.7.9

Current Issues
==============

There are some currently known problems.  Libbfd and libiberty weren't meant to be standalone libraries.  I needed a PPU version of libiberty to compile a PS3 program or two so I recompiled it from the binutils package as a powerpc64 library.  To get libbfd to work, you might need to add the libiberty library to the linker options.

I had trouble running the example from Wargio's NoRSX library.  It ran exteremly slow and I couldn't exit.  I can't figure out what I did wrong.  

I didn't try to compile many sample programs.  Some of the code for them might need updating.

I can only test this in Linux because that's all I run.  I doubt the mingw-toolchain.sh script will work.  If you notice a problem and can fix it, please send me a patch or tell me how it's done so I can update the repository.  I worked for a long time on this and I doubt I'll be able to spend a lot more time fixing it.  If I can though, I will.  If anyone wants to help, please let me know.

If your programs no longer compiles, the code or Makefile might need updating.  You might need to switch the order of the libraries around.  For example, for the PSChannel application, I had to modify the Makefile.  Under the LIBS section, I had to move -liberty to after -lfontconfig and I needed to add -ltiff to the end.  For the CFLAGS I needed to add -I$(PS3DEV)/portlibs/ppu/lib/libzip/include so it'd find the zipconf.h header file.  That's the correct installation location for the zipconf.h header.

Installation
============

To install:
 Clone the repository and run ./toolchain.sh in the directory it creates.
  git clone git://github.com/Spork-Schivago/toolchain
  cd toolchain
  ./toolchain.sh

If there is a package you don't want installed, A chmod -x <script name> in the script directory should prevent it from executing.  If not, simply remove the script from the directory.

Thanks
======
I couldn't of gotten this far if it was not for the great people on the fontconfig, cairo, curl, and the tiff mailing list along with some of the PS3 developers answering some of my dumb questions.

