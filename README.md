Toolchain
=========

This is a beta version of a more up-to-date toolchain for the PS3 which includes  
the PS3Libraries with some additions and the Enlightenment Foundation Libraries.  

Have a look at **PACKAGES** to see what's included and check out **STATUS** to the see the current status.  

  **Current Issues**  
  There are some currently known problems.  Libbfd and libiberty weren't meant to be standalone libraries.  I needed
  a PPU version of libiberty to compile a PS3 program or two so I recompiled it from the binutils package as a
  powerpc64 library.  To get libbfd to work, you might need to add the libiberty library to the linker options.

  I had trouble running the example from Wargio's NoRSX library.  It ran extremely slow and I couldn't exit. After
  talking to Wargio, him and I both believe it's something with my toolchain.  

  I can only test this in Linux because that's all I run.  I doubt the mingw-toolchain.sh script will work.  If you
  notice a problem and can fix it, please send me a patch or tell me how it's done so I can update the repository.
  I worked for a long time on this and I doubt I'll be able to spend much time in the near future fixing it.  I'll try
  to work on it when I can.  If anyone wants to help, please let me know via e-mail at SporkSchivago@gmail.com.

  If your programs no longer compile, the code or Makefile might need to be modified.  You might need to switch the
  order of the libraries around.  For example, for the PSChannel homebrew application, I had to modify the Makefile.
  Under the LIBS section, I had to move -liberty to after -lfontconfig and I needed to add -ltiff to the end.  
  For the CFLAGS I needed to add -I${PS3DEV}/portlibs/ppu/lib/libzip/include so it'd find the zipconf.h header file.
  That's the correct installation location for the zipconf.h header.

  **Installation**  
   First backup your current version of the toolchain (if it exists).

    mv ${PS3DEV} ${PS3DEV}.backup  
   That way if something goes wrong, you can simply rm -rf ${PS3DEV} and then mv ${PS3DEV}.backup ${PS3DEV}.  

   Setup your environmental variables.
   
    nano -w ~/.bashrc  
    export PS3DEV=/usr/local/ps3dev  
    export PSL1GHT=$PS3DEV/psl1ght  
    export PATH=$PATH:$PS3DEV/bin:$PS3DEV/host/ppu/bin:$PS3DEV/host/spu/bin:$PSL1GHT/host/
   Save the file, logout and log back in.

   Clone the repository and execute toolchain.sh
   
    git clone git://github.com/Spork-Schivago/toolchain  
    cd toolchain  
    ./toolchain.sh  
  
  If there is a package you don't want installed, a chmod -x (script name) in the script directory should prevent it
  from executing.  If not, simply remove the script from the directory.  Certain packages depend on other packages
  so unless you know what you are doing, I highly suggest you only disable ps3elf and maybe one of the SDL2 if you
  do not need it.  If there's anything you want added, let me know.
