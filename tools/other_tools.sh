#!/usr/bin/env bash

# 1. install ag
sudo apt install silversearcher-ag -y -q=2

# 2. install sack
git clone --depth 1 https://github.com/sampson-chen/sack.git
cd sack
chmod +x install_sack.sh
./install_sack.sh
cd ..
rm -rf sack

# rm ~/bin/ack
# sudo apt-get install ack-grep
# sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
curl https://beyondgrep.com/ack-v3.1.2 > ~/bin/ack && chmod 0755 ~/bin/ack

# 3. install peek
sudo add-apt-repository ppa:peek-developers/stable -yn
sudo apt update -q=2 && sudo apt install peek -y -q=2