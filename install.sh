#!/bin/bash

# Ubuntu 20.04 First Setup Scripts


# System Update & Upgrade
update_system() {
    sudo apt update
    sudo apt dist-upgrade -y
    sudo snap refresh
}
update_system;

# Default Ubuntu Packages Install
install_python_ubuntu_packages() {
    sudo apt install -y \
        python3-dev \
        python3-pip \
        python3-venv \
        python3-setuptools \
        python3-distutils \
        python3-testresources \
        python3-launchpadlib
}
install_python_ubuntu_packages;

install_default_ubuntu_packages() {
    sudo apt install -y \
        ubuntu-restricted-extras \
        build-essential \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        net-tools \
        git \
        wget \
        curl \
        default-jdk \
        golang-go \
        silversearcher-ag \
        htop
}
install_default_ubuntu_packages;


install_extras_ubuntu_packages() {
    sudo apt install -y \
        aria2 \
        asciinema \
        tilix \
        qbittorrent \
        shutter \
        simplescreenrecorder \
        obs-studio \
        ffmpeg
}
install_extras_ubuntu_packages;


install_python_packages() {
    pip3 install --user --no-cache-dir --upgrade \
    pip \
    virtualenv \
    pip-check \
    poetry \
    ipython \
    jupyter \
    jupyter_contrib_nbextensions
}
install_python_packages;


# Sublime Text - Merge
install_sublime() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

    sudo apt update
    sudo install sublime-merge sublime-text -y
}
install_sublime;



# Tilix conf load
echo "
[/]
quake-specific-monitor=0
terminal-title-style='none'
theme-variant='dark'
warn-vte-config-issue=false
window-style='disable-csd-hide-toolbar'

[keybindings]
terminal-advanced-paste='<Primary><Shift>v'
terminal-paste='<Primary>v'

[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
background-color='#282936'
background-transparency-percent=0
badge-color-set=false
bold-color-set=false
bold-is-bright=true
cell-height-scale=1.0
cell-width-scale=1.0
cursor-colors-set=false
default-size-columns=130
dim-transparency-percent=0
font='Ubuntu Mono 13'
foreground-color='#F8F8F2'
highlight-colors-set=false
palette=['#000000', '#FF5454', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF79C6', '#8BE8FD', '#BFBFBF', '#4D4D4D', '#FF6E67', '#5AF78D', '#F4F99D', '#CAA8FA', '#FF92D0', '#9AEDFE', '#E6E6E6']
use-system-font=false
use-theme-colors=false
visible-name='Default'
" > tilix.dconf
dconf load /com/gexperts/Tilix/ < tilix.dconf
rm tilix.dconf


# Fonts install
install_fonts() {
    wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
    wget https://github.com/tonsky/FiraCode/releases/download/3.1/FiraCode_3.1.zip
    wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip
    unzip -o Hack-v3.003-ttf.zip -d ~/.fonts/hack/
    unzip -o FiraCode_3.1.zip -d ~/.fonts/firacode/
    unzip -o JetBrainsMono-1.0.3.zip -d ~/.fonts/jetbrains/

    fc-cache -f -v
}
install_fonts;


# VsCode install
install_vscode () {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get install code
}




# System Settings
# Update system watch file limits
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
