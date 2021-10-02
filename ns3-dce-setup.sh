#!/bin/bash

# install dependencies
pip3 install distro

# clone bake
git clone https://gitlab.com/nsnam/bake.git
cd bake
export PATH=$PATH:`pwd`/build/bin:`pwd`/build/bin_dce
export PYTHONPATH=`pwd`/build/lib${PYTHONPATH:+:$PYTHONPATH}
export LD_LIBRARY_PATH=`pwd`/build/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export DCE_PATH=`pwd`/build/bin_dce:`pwd`/build/sbin

# intall dce
./bake.py configure -e dce-ns3-1.11
# ./bake.py configure -e dce-ns3-dev
./bake.py check
./bake.py show
./bake.py download
./bake.py build -vvv

# install DCE with WAF
# export HOME=`pwd`
# mkdir dce
# cd dce

whoami
printenv

