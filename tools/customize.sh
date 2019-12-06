#!/usr/bin/env bash

# Custom User Settings
npm config set init.author.name "Özkan ŞEN"
npm config set init.author.email "ozkansen@gmail.com"

git config --global user.name "Özkan ŞEN"
git config --global user.email "ozkansen@gmail.com"
git config --global core.editor "code --wait"
git config --global credential.helper store

# Pipenv .venv folder in project folder
echo export PIPENV_VENV_IN_PROJECT=true >> ~/.profile >> ~/.bashrc

# Create desktop workspace folder
mkdir ~/Desktop/workspace/
cd ~/Desktop/workspace

# Vagrant test server
git clone https://github.com/ozkansen/ubuntu_server.git
cd ~

# Add update & clean Apt Update Clean
echo "alias update='sudo apt update; sudo apt list --upgradable; sudo apt dist-upgrade -y; npm update -g; pip-check -UHu'" >> ~/.profile >> ~/.bashrc
echo "alias clean='sudo apt clean; sudo apt purge; sudo apt autoclean; sudo apt autoremove'" >> ~/.profile >> ~/.bashrc

# Add custom commands
echo "alias wget++='aria2c -x 16 -s 16 -k 1M'" >> ~/.profile >> ~/.bashrc

# Add system watches files
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

source ~/.profile
source ~/.bashrc
