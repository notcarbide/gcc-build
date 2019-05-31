### Script for building gcc using ClearLinux specs

Search for `BuildRequires` [here](https://raw.githubusercontent.com/clearlinux-pkgs/gcc/master/gcc.spec) for requirements.

Usage:
```
mkdir gcc && cd gcc
git clone https://github.com/notcarbide/gcc-build.git -b gcc-9
git clone https://github.com/notcarbide/gcc-8 -b gcc-9-dev src
cd gcc-build
./build.sh
```

Install:
```
sudo make LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH install
```

Configure as default `gcc`:
```
# Value 80 can be set to whatever priority you want
# Higher means it's more likely to default via auto

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9.1 80 --slave /usr/bin/g++ g++ /usr/bin/g++-9.1

# If priority is lower than current default gcc

sudo update-alternatives --config gcc

# Select version for compiled gcc from list
# ex: /use/bin/gcc-9.1

# Check gcc version

gcc -v
```
