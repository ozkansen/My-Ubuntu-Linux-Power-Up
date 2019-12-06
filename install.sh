#!/usr/bin/env bash

echo "
*************************************
*** Update & Upgrade Ubuntu Linux ***
*************************************
"
sudo apt update -q=2 && sudo apt install curl wget -y -q=2

# Run Repository File
sh ./tools/repository.sh

# Install Envrionment
sudo apt update -q=2 && sudo apt list --upgradable && sudo apt dist-upgrade -y -q=2 && sudo snap refresh
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install ubuntu-restricted-extras \
                build-essential \
                libssl-dev \
                zlib1g-dev \
                cmake \
                default-jdk \
                gconf2 \
                python-dev \
                python3-dev \
                python3-pip \
                python3-setuptools \
                python3-distutils \
                git \
                typora \
                golang-go \
                qbittorrent \
                paper-icon-theme \
                gnome-tweak-tool \
                google-chrome-stable \
                simplescreenrecorder \
                simplescreenrecorder-lib:i386 \
                obs-studio \
                ffmpeg \
                kazam \
                grub-customizer \
                shutter \
                sublime-merge \
                sublime-text \
                asciinema \
                net-tools \
                aria2 \
                -y -q=2

sh ./tools/vim.sh
sh ./tools/nodejs.sh
sh ./tools/git_tools.sh
sh ./tools/vagrant_virtualbox.sh
sh ./tools/tilix.sh
sh ./tools/test_tools.sh
sh ./tools/other_tools.sh
sh ./tools/fonts.sh
sh ./tools/docker.sh

# Python Packages
pip3 install --user --no-cache-dir --upgrade --force-reinstall -r ./tools/pip_packages.txt

sh ./tools/customize.sh

# Install Notes
echo "
**************************************************************
***                                                        ***
***  Install Notes                                         ***
***  Tweaks > Appearance > Applications > Adwaita-dark     ***
***  Tweaks > Appearance > Icons > Paper                   ***
***  Tweaks > Fonts > [your_favourite_font]                ***
***                                                        ***
***  Select Terminal                                       ***
***  sudo update-alternatives --config x-terminal-emulator ***
***                                                        ***
***  Nvidia Driver                                         ***
***  sudo apt install nvidia-driver-440                    ***
***                                                        ***
***  Vagrant Ubuntu Server Install                         ***
***  cd ~/Desktop/workspace/ubuntu_server && vagrant up    ***
***                                                        ***
**************************************************************
"

# Command List
echo "echo -n\"
**************************************************************
***                                                        ***
***  Alias Command List                                    ***
***  dclean -> docker prune all                            ***
***  dremove -> docker remove all container, images        ***
***  dlist -> docker list all container                    ***
***  dstop -> docker stop all                              ***
***  dcomposereup -> docker compose rebuild up             ***
***                                                        ***
***  update -> apt update upgrade, npm update, pip-check   ***
***  clean -> apt clean purge autoremove autoclean         ***
***                                                        ***
**************************************************************
\"" >> ~/.bashrc


echo "
sudo snap install vlc \
                  telegram-desktop \
                  discord \
                  spotify \
                  htop \
                  postman

sudo snap install code --classic
sudo snap install pycharm-professional --classic
sudo snap install datagrip --classic
sudo snap install webstorm --classic
sudo snap install slack --classic
sudo snap install skype --classic
"