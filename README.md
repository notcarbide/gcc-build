### Script for building gcc using ClearLinux specs

Search for `BuildRequires` [here](https://raw.githubusercontent.com/clearlinux-pkgs/gcc/master/gcc.spec) for requirements.

Usage:
```
mkdir gcc && cd gcc
git clone https://github.com/notcarbide/gcc-build.git
git clone https://github.com/notcarbide/gcc-8 src
cd gcc-build
./build.sh
```

Install:
```
sudo make LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH install
```

Clean:
```
git clean -df
```

Configure as default `gcc`:
```
# Value 80 can be set to whatever priority you want
# Higher means it's more likely to default via auto

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8.3 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8.3

# If priority is lower than current default gcc

sudo update-alternatives --config gcc

# Select version for compiled gcc from list
# ex: /usr/bin/gcc-8.3

# Check gcc version

gcc -v
```
