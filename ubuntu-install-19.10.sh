#!/bin/bash

echo "
*************************************
*** Update & Upgrade Ubuntu Linux ***
*************************************
"

sudo apt update -q=2 && sudo apt install curl wget -y -q=2

########## Add Repo ###########
# # Nvidia Latest
sudo add-apt-repository ppa:graphics-drivers -yn

# # Git Latest
sudo add-apt-repository ppa:git-core/ppa -yn

# # Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

# Terminix
#sudo add-apt-repository ppa:webupd8team/terminix -yn

# Nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Golang
sudo add-apt-repository ppa:longsleep/golang-backports -yn

# QBittorrent Latest
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -yn

# Vim Latest
sudo add-apt-repository ppa:jonathonf/vim -yn

# Gnome Theme
#sudo add-apt-repository -u ppa:snwh/ppa -yn

# Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Simple Screen Recorder
#sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -yn

# OBS Recorder
sudo apt-add-repository ppa:obsproject/obs-studio -yn

# Kazam Recorder
#sudo apt-add-repository ppa:sylvain-pineau/kazam -yn

# Grub Customizer
#sudo add-apt-repository ppa:danielrichter2007/grub-customizer -yn

# ScreenShoot Tool
sudo add-apt-repository ppa:linuxuprising/shutter -yn

# Neovim
#sudo add-apt-repository ppa:neovim-ppa/stable -yn

# Sublime Text - Merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
########## End Add Repo ###########

# Install Envrionment
sudo apt update -q=2 && sudo apt list --upgradable && sudo apt dist-upgrade -y -q=2 && sudo snap refresh
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

# paper-icon-theme \
# simplescreenrecorder-lib:i386 \
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
                tilix \
                golang-go \
                qbittorrent \
                vim \
                gnome-tweak-tool \
                google-chrome-stable \
                simplescreenrecorder \
                obs-studio \
                ffmpeg \
                kazam \
                nodejs \
                grub-customizer \
                shutter \
                neovim \
                sublime-merge \
                sublime-text \
                aria2 \
                net-tools \
                asciinema \
                -y -q=2


# SmartGit
wget -q https://www.syntevo.com/downloads/smartgit/smartgit-19_1_4.deb
sudo dpkg -i smartgit*.deb
rm smartgit*.deb
sudo apt --fix-broken install -y

# Virtualbox & Vagrant
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#sudo apt-add-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo bash -c 'echo deb https://vagrant-deb.linestarve.com/ any main > /etc/apt/sources.list.d/wolfgang42-vagrant.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4
sudo apt update -q=2 && sudo apt install virtualbox vagrant -y -q=2
vagrant plugin install vagrant-vbguest

mkdir ~/Desktop/workspace/
cd ~/Desktop/workspace
git clone https://github.com/ozkansen/ubuntu_server.git
cd ~

# NVM NodeJs Specifice version installer
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh -o install_nvm.sh
chmod +x install_nvm.sh && ./install_nvm.sh
rm install_nvm.sh

source ~/.profile

# Configure
git config --global user.name "Özkan ŞEN"
git config --global user.email "ozkansen@gmail.com"
git config --global core.editor "code --wait"
git config --global credential.helper store

cd ~ && mkdir .node_modules_global
npm config set prefix=$HOME/.node_modules_global

npm config set init.author.name "Özkan ŞEN"
npm config set init.author.email "ozkansen@gmail.com"

echo export PATH="~/.local/bin/:\$PATH" >> ~/.profile >> ~/.bashrc
echo export PATH="~/.node_modules_global/bin/:\$PATH" >> ~/.profile >> ~/.bashrc
echo export PIPENV_VENV_IN_PROJECT=true >> ~/.profile >> ~/.bashrc

source ~/.profile

# Python Packages
pip3 install --user --no-cache-dir --upgrade --force-reinstall \
    pip \
    virtualenv \
    pipenv \
    pip-check \
    httpie

# Npm Packages
npm install npm@latest -g
npm rebuild
npm install -g loadtest \
               nodemon \
               purify-css \
               create-react-app \
               sass \
               eslint \
               prettier \
               typescript \
               prettier-stylelint \
               prettier-eslint \
               prettier-tslint \
               yarn \
               @vue/cli \
               @vue/cli-init

# wrk & wrk2 test tool
git clone https://github.com/wg/wrk.git --depth 1
cd wrk
make --quiet
mv ./wrk ~/.local/bin/wrk
cd ..
rm -rf wrk/

git clone https://github.com/giltene/wrk2.git --depth 1
cd wrk2
make --quiet
mv ./wrk ~/.local/bin/wrk2
cd ..
rm -rf wrk2/

# Fonts
git clone --depth 1 https://github.com/tonsky/FiraCode.git ~/.fonts/firacode
fc-cache -f -v ~/.fonts/firacode

git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip -o Hack-v3.003-ttf.zip -d ~/.fonts/hack/
rm Hack-v3.003-ttf.zip
fc-cache -f -v ~/.fonts/hack

wget https://www.fontsquirrel.com/fonts/download/courier-prime-code
unzip -o courier-prime-code -d ~/.fonts/courier-prime-code/
rm courier-prime-code

# Git P4Merge Visual Merge Tool
wget https://www.perforce.com/downloads/perforce/r19.2/bin.linux26x86_64/p4v.tgz
tar zxvf p4v.tgz
sudo cp -r p4v-* /usr/local/p4v/
rm -r p4v*
sudo ln -s /usr/local/p4v/bin/p4merge /usr/local/bin/p4merge

# P4Merge Set Git Config
git config --global diff.tool p4merge
git config --global difftool.p4merge.path /usr/local/bin/p4merge
git config --global difftool.prompt false

git config --global merge.tool p4merge
git config --global mergetool.p4merge.path /usr/local/bin/p4merge
git config --global mergetool.prompt false

# GitBatch Install
curl -OL https://github.com/isacikgoz/gitbatch/releases/download/v0.5.0/gitbatch_0.5.0_linux_amd64.tar.gz
tar xzf gitbatch_0.5.0_linux_amd64.tar.gz
mv gitbatch ~/.local/bin/
rm ~/gitbatch_0.5.0_linux_amd64.tar.gz

# Other Tools

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

# Vim Configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Tilix Load Configuration
# dconf dump /com/gexperts/Tilix/ > tilix.dconf
# dconf load /com/gexperts/Tilix/ < tilix.dconf
echo "
[/]
warn-vte-config-issue=false
terminal-title-style='none'
quake-specific-monitor=0
window-style='disable-csd-hide-toolbar'

[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
foreground-color='#F8F8F2'
visible-name='Default'
palette=['#272822', '#F92672', '#A6E22E', '#F4BF75', '#66D9EF', '#AE81FF', '#A1EFE4', '#F8F8F2', '#75715E', '#F92672', '#A6E22E', '#F4BF75', '#66D9EF', '#AE81FF', '#A1EFE4', '#F9F8F5']
badge-color-set=false
default-size-columns=132
use-system-font=false
cursor-colors-set=false
highlight-colors-set=false
use-theme-colors=false
bold-color-set=false
font='Hack 10'
background-color='#272822'
" > tilix.dconf

dconf load /com/gexperts/Tilix/ < tilix.dconf
rm tilix.dconf

# Docker Latest Install
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    -y -q=2

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"

sudo apt-get update -q=2
sudo apt-get install docker-ce docker-ce-cli containerd.io -y -q=2

sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Machine
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
rm docker-machine

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Kubernetes
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# minicube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
rm minikube

# ctop docker ps view
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

# Add dockerclean command
echo "alias dclean='docker system prune -f; docker volume prune -f; docker network prune -f'" >> ~/.profile >> ~/.bashrc
echo "alias dremove='docker rm \$(docker ps -aq) -f; docker rmi \$(docker images -q) -f; docker volume rm \$(docker volume ls -q) -f'" >> ~/.profile >> ~/.bashrc
echo "alias dlist='docker ps -a'" >> ~/.profile >> ~/.bashrc
echo "alias dstop='docker stop \$(docker ps -aq)'" >> ~/.profile >> ~/.bashrc

# Add dcup command
echo "alias dcomposereup='docker-compose up --build --force-recreate --remove-orphans'" >> ~/.profile >> ~/.bashrc

# Add update & clean Apt Update Clean
echo "alias update='sudo apt update; sudo apt list --upgradable; sudo apt dist-upgrade -y; npm update -g; pip-check -UHu'" >> ~/.profile >> ~/.bashrc
echo "alias clean='sudo apt clean; sudo apt purge; sudo apt autoclean; sudo apt autoremove'" >> ~/.profile >> ~/.bashrc

# Add custom commands
echo "alias wget++='aria2c -x 16 -s 16 -k 1M'" >> ~/.profile >> ~/.bashrc

# Add system watches files
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

source ~/.profile

# Neovim Install
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/utkuufuk/ubuntu-on-steroids/master/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim ~/.config/nvim/init.vim +:PlugInstall +qall

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

echo -n "
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