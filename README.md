These scripts create a cross-compiler toolchain in your `$HOME/usr` directory.
This kind of cross-compiler is mostly useful for basic Operating System developpment.

Included packages
-----------------

These scripts install the following things in the toolchain :

- binutils (ld, ...)
- gcc for C and C++

Supported cross-compiling architectures
---------------------------------------

- x86		i586-elf
- arm		arm-elf

The scripts for both architecture are very similar, feel free to adapt them to other architectures.

Setting up the cross-compiler
-----------------------------

- Create a directory named `usr` in your home directory.
- Add the following line to your `.bashrc` : `export PATH=$PATH:$HOME/usr/bin`
- Run `cross-<arch>.sh` for the architecture you target
  Go on the internet and read some useless stuff, this step is long.

The compiler is available as `*-gcc` and `*-g++`, where * is one of the prefixes listed above (ex: i586-elf-gcc).

