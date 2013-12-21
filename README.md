toolchain
=========

current issues
==============

There are some currently known problems.  Libbfd and libiberty weren't meant to be standalone libraries.  I needed 
a PPU version of libiberty to compile a PS3 program or two so I recompiled it from the binutils package as a 
powerpc64 library.  To get libbfd to work, you might need to add the libiberty library to the linker options.

I had trouble running the example from Wargio's NoRSX library.  It ran exteremly slow and I couldn't exit.  I can't 
figure out what I did wrong.

I didn't try to compile many sample programs.  Some of the code for them might need updating.

I can only test this in Linux because that's all I run.  I doubt the mingw-toolchain.sh script will work.  If you 
notice a problem and can fix it, please send me a patch or tell me how it's done so I can update the repository.
I worked for a long time on this and I doubt I'll be able to spend a lot more time fixing it.  If I can though, 
I will.  If anyone wants to help, please let me know.

If your programs no longer compiles, the code or Makefile might need updating.  You might need to switch the order 
of the libraries around.  For example, for the PSChannel application, I had to modify the Makefile.  Under the 
LIBS section, I had to move -liberty to after -lfontconfig and I needed to add -ltiff to the end.  For the CFLAGS I 
needed to add -I$(PS3DEV)/portlibs/ppu/lib/libzip/include so it'd find the zipconf.h header file.  That's the correct 
installation location for the zipconf.h header.

installation
============

To install:
 Clone the repository and run ./toolchain.sh in the directory it creates.
  git clone git://github.com/Spork-Schivago/toolchain
  cd toolchain
  ./toolchain.sh

If there is a package you don't want installed, A chmod -x (script name) in the script directory should prevent it 
from executing.  If not, simply remove the script from the directory.

Thanks
======
I couldn't of gotten this far if it was not for the great people on the fontconfig, cairo, curl, and the tiff 
mailing list along with some of the PS3 developers answering some of my dumb questions.  Thanks!
