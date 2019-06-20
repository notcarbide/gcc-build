#!/bin/bash
#
# Script for building gcc using ClearLinux specs
# by @notcarbide https://github.com/notcarbide
#
# Check 'BuildRequires'in this file for dependencies:
# https://raw.githubusercontent.com/clearlinux-pkgs/gcc/master/gcc.spec
#

unset CFLAGS
unset CXXFLAGS
export CFLAGS="-march=westmere -g1 -O3 -fstack-protector -Wl,-z -Wl,now -Wl,-z -Wl,relro -Wl,-z,max-page-size=0x1000 -mtune=skylake"
export CXXFLAGS="-march=westmere -g1 -O3 -Wl,-z,max-page-size=0x1000 -mtune=skylake"
export CFLAGS_FOR_TARGET="$CFLAGS"
export CXXFLAGS_FOR_TARGET="$CXXFLAGS"
export FFLAGS_FOR_TARGET="$FFLAGS"
export CPATH=/usr/include
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

 ../src/configure \
    --prefix=/usr \
    --libdir=/usr/lib/x86_64-linux-gnu \
    --enable-libstdcxx-pch\
    --libexecdir=/usr/lib/x86_64-linux-gnu \
    --with-system-zlib\
    --enable-shared\
    --enable-gnu-indirect-function \
    --disable-vtable-verify \
    --enable-threads=posix\
    --enable-__cxa_atexit\
    --enable-plugin\
    --enable-ld=default\
    --enable-clocale=gnu\
    --disable-multiarch\
    --enable-multilib\
    --enable-lto\
    --disable-werror \
    --enable-linker-build-id \
    --build='x86_64-linux-gnu'\
    --target='x86_64-linux-gnu'\
    --enable-languages="c,c++,fortran,go" \
    --enable-bootstrap \
    --with-ppl=yes \
    --with-isl \
    --includedir=/usr/include \
    --exec-prefix=/usr \
    --disable-libunwind-exceptions \
    --with-gnu-ld \
    --with-tune=haswell \
    --with-arch=westmere \
    --enable-cet \
    --disable-libmpx \
    --with-gcc-major-version-only \
    --program-suffix=-9.1 \
    --enable-default-pie

make -j 4 profiledbootstrap
