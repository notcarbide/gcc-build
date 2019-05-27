### Script for building gcc using ClearLinux specs

Search for BuildRequires [here](https://raw.githubusercontent.com/clearlinux-pkgs/gcc/master/gcc.spec) for requirements.

Usage:
```
mkdir gcc && cd gcc
git clone https://github.com/notcarbide/gcc-build.git
git clone https://github.com/notcarbide/gcc-8 src
cd gcc-build
./build.sh
```
