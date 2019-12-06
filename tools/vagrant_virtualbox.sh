#!/usr/bin/env bash

# Virtualbox & Vagrant
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo bash -c 'echo deb https://vagrant-deb.linestarve.com/ any main > /etc/apt/sources.list.d/wolfgang42-vagrant.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4
sudo apt update -q=2 && sudo apt install virtualbox-6.0 vagrant -y -q=2
vagrant plugin install vagrant-vbguest
