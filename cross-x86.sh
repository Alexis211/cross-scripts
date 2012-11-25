#!/bin/sh

GCC=4.6.3
BINUTILS=2.22
ARCH=x86

cd `dirname $0`

export BASEDIR=`pwd`
export PREFIX=$HOME/usr
export TARGET=i586-elf

echo " ==> FETCHING CROSS COMPILER ARCHIVES <=="
if [ ! -f gcc-core-$GCC.tar.bz2 ]; then wget http://ftp.gnu.org/gnu/gcc/gcc-$GCC/gcc-core-$GCC.tar.bz2; fi
if [ ! -f gcc-g++-$GCC.tar.bz2 ]; then wget http://ftp.gnu.org/gnu/gcc/gcc-$GCC/gcc-g++-$GCC.tar.bz2; fi
if [ ! -f binutils-$BINUTILS.tar.bz2 ]; then wget http://ftp.gnu.org/gnu/binutils/binutils-$BINUTILS.tar.bz2; fi

mkdir build-$ARCH
cd build-$ARCH

echo " ==> EXTRACTING ARCHIVES <=="
tar xjf ../gcc-core-$GCC.tar.bz2
tar xjf ../gcc-g++-$GCC.tar.bz2
tar xjf ../binutils-$BINUTILS.tar.bz2

mkdir build-binutils-$BINUTILS
mkdir build-gcc-$GCC

echo " =>> STARTING BUILD <<="
cd build-binutils-$BINUTILS
../binutils-$BINUTILS/configure --prefix=$PREFIX --target=$TARGET --disable-nls || exit
make all || exit
make install || exit

export PATH=$PATH:$PREFIX/bin

cd ../build-gcc-$GCC
../gcc-$GCC/configure --prefix=$PREFIX --target=$TARGET --disable-nls --enable-languages=c,c++ --without-headers || exit
make all-gcc || exit
make install-gcc || exit
make all-target-libgcc || exit
make install-target-libgcc || exit
