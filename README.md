toolchain
=========

This is a beta version of a more up-to-date toolchain for the PS3 which also includes
the PS3Libraries with some additions and the Enlightenment Foundation Libraries.

It includes the following: <br>
  <b>Toolchain</b> <br>
  binutils-2.23.2 <br>
  gcc-4.8.2 <br>
  newlib-2.0.0 <br>
  gdb-7.6.1 <br>
  psl1ght-v2 <br>
  a ppu version of libiberty <br>
  a not working so well ppu version of libbfd <br>

  <b>PS3 Libraries:</b> <br>
  zlib-1.2.8 <br>
  libpng-1.6.6 <br>
  jpeg-v9 <br>
  freetype-2.5.0.1 <br>
  pixman-0.32.2 <br>
  cairo-1.12.16 <br>
  libogg-1.3.1 <br>
  libvorbis-1.3.3 <br>
  libzip-0.11.1 <br>
  tiff-4.0.3 <br>
  libmikmod-3.3.3 <br>
  libxml2-2.9.1 <br>
  webp-0.3.1 <br>
  flac-1.3.0 <br>
  libmad-0.15.1b <br>
  Zeldin's SDL1 for the psl1ght <br>
  updated SDL1 libraries <br>
  SDL2-2.0.1 <br>
  SDL2 libraries <br>
  polarssl-1.3.2 <br>
  libcurl-7.33.0 <br>
  faad2-2.7 <br>
  libtheora-1.1.1 <br>
  libintl-lite-0.5 <br>
  Wargio's NoRSX-0.3.1 <br>
  libjson-0.11 <br>

  <b>EFL Libraries:</b> <br>
  escape <br>
  eina-1.7.9 <br>
  eet-1.7.9 <br>
  expat-2.1.0 <br>
  fontconfig-2.11.0 <br>
  evas-1.7.9 <br>
  expedite-1.7.9 <br>
  c-ares-1.10.0 <br>
  ecore-1.7.9 <br>
  embryo-1.7.9 <br>
  lua-5.2.3 <br>
  edje-1.7.9 <br>
  chipmunk-6.2.1 <br>
  eskiss <br>
  elementary-1.7.9 <br>

  <b>current issues</b> <br>
  There are some currently known problems.  Libbfd and libiberty weren't meant to be standalone libraries.  I needed
  a PPU version of libiberty to compile a PS3 program or two so I recompiled it from the binutils package as a
  powerpc64 library.  To get libbfd to work, you might need to add the libiberty library to the linker options.
  
  I had trouble running the example from Wargio's NoRSX library.  It ran extremely slow and I couldn't exit.  I cannot
  figure out what is wrong.
  
  I didn't try to compile many sample programs.  Some of the code might need updating.
  
  I can only test this in Linux because that's all I run.  I doubt the mingw-toolchain.sh script will work.  If you
  notice a problem and can fix it, please send me a patch or tell me how it's done so I can update the repository.
  I worked for a long time on this and I doubt I'll be able to spend much time in the near future fixing it.  I'll try to
  work on it when I can.  If anyone wants to help, please let me know.
  
  If your programs no longer compile, the code or Makefile might need to be modified.  You might need to switch the order
  of the libraries around.  For example, for the PSChannel homebrew application, I had to modify the Makefile.  Under the
  LIBS section, I had to move -liberty to after -lfontconfig and I needed to add -ltiff to the end.  For the CFLAGS I
  needed to add -I${PS3DEV}/portlibs/ppu/lib/libzip/include so it'd find the zipconf.h header file.  That's the correct
  installation location for the zipconf.h header.
  
  <b>installation</b> <br>
  
  To install: <br>
   First backup your current version of the toolchain.
   ie. mv ${PS3DEV} ${PS3DEV}.backup
   That way if something goes wrong, you can simply rm -rf ${PS3DEV} and then mv ${PS3DEV}.backup ${PS3DEV}.
   
   Clone the repository and run ./toolchain.sh in the directory it creates.
   git clone git://github.com/Spork-Schivago/toolchain
   cd toolchain
   ./toolchain.sh
   
   If there is a package you don't want installed, a chmod -x (script name) in the script directory should prevent it
   from executing.  If not, simply remove the script from the directory.  If there's anything you want added, let me 
   know.
   
   <b>Thanks</b> <br>
   I couldn't of gotten this far if it was not for the great people on the fontconfig, cairo, curl, and the tiff
   mailing list along with some of the PS3 developers answering some of my dumb questions.  Thanks!
   
