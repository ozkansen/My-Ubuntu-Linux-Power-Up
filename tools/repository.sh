#!/usr/bin/env bash

########## Add Repo ###########
# # Nvidia Latest
sudo add-apt-repository ppa:graphics-drivers -yn

# # Git Latest
sudo add-apt-repository ppa:git-core/ppa -yn

# # Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

# Golang
sudo add-apt-repository ppa:longsleep/golang-backports -yn

# QBittorrent Latest
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -yn

# Gnome Theme
sudo add-apt-repository -u ppa:snwh/ppa -yn

# Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Simple Screen Recorder
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -yn

# OBS Recorder
sudo apt-add-repository ppa:obsproject/obs-studio -yn

# Kazam Recorder
sudo apt-add-repository ppa:sylvain-pineau/kazam -yn

# Grub Customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -yn

# ScreenShoot Tool
sudo add-apt-repository ppa:linuxuprising/shutter -yn

# Sublime Text - Merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
########## End Add Repo ###########