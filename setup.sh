#!/bin/bash

# Dont forget add /etc/fstab noatime parameter
#  /dev/mapper/vgubuntu-root /               ext4    noatime,errors=remount-ro 0
function update_system_settings() {
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
    echo vm.swappiness=10 | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
}

function load_repo() {

    # Nvidia
    sudo add-apt-repository ppa:graphics-drivers -yn

    # Git
    sudo add-apt-repository ppa:git-core/ppa -yn

    # QBittorrent
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -yn

    # Google Chrome
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

    # Typora
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./' -yn

    # Sublime
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

    # Vscode
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    sudo add-apt-repository -yn \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
}

function system_upgrade() {
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt install -y \
        curl \
        wget \
        git

    sudo snap refresh
}

function install_packages() {
    sudo apt install -y \
        ubuntu-restricted-extras \
        ubuntu-restricted-addons
    aria2 \
        asciinema \
        tilix \
        qbittorrent \
        simplescreenrecorder \
        obs-studio \
        ffmpeg \
        typora
}

function install_development_ubuntu_packages() {
    sudo apt install -y \
        python3-dev \
        python3-pip \
        python3-venv \
        python3-virtualenv \
        python3-setuptools \
        python3-distutils \
        python3-testresources \
        python3-launchpadlib \
        golang \
        build-essential \
        default-jdk \
        sublime-merge \
        sublime-text \
        code \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        software-properties-common \
        net-tools \
        silversearcher-ag \
        htop \
        bat \
        tmux
}

install_fonts() {
    wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
    wget https://github.com/tonsky/FiraCode/releases/download/3.1/FiraCode_3.1.zip
    wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip
    mkdir ~/.fonts/
    unzip -o Hack-v3.003-ttf.zip -d ~/.fonts/hack/
    unzip -o FiraCode_3.1.zip -d ~/.fonts/firacode/
    unzip -o JetBrainsMono-1.0.3.zip -d ~/.fonts/jetbrains/
    rm -f Hack-v3.003-ttf.zip FiraCode_3.1.zip JetBrainsMono-1.0.3.zip
    fc-cache -f -v
}

settings_git() {
    git config --global user.name "Özkan ŞEN"
    git config --global user.email "ozkansen@gmail.com"
    git config --global core.editor "code --wait"
    git config --global credential.helper store

    git config --global diff.tool p4merge
    git config --global difftool.p4merge.path /usr/local/bin/p4merge
    git config --global difftool.prompt false

    git config --global merge.tool p4merge
    git config --global mergetool.p4merge.path /usr/local/bin/p4merge
    git config --global mergetool.prompt false
}

install_p4mergetool() {
    wget https://cdist2.perforce.com/perforce/r20.1/bin.linux26x86_64/p4v.tgz
    tar zxvf p4v.tgz
    sudo cp -r p4v-* /usr/local/p4v/
    rm -r p4v*
    sudo ln -s /usr/local/p4v/bin/p4merge /usr/local/bin/p4merge
}

install_python_packages() {
    pip install --no-cache-dir --upgrade \
        pip \
        setuptools

    pip install --no-cache-dir --upgrade \
        virtualenv \
        pip-check \
        poetry \
        ipython \
        jupyter \
        jupyter_contrib_nbextensions \
        jupyter_nbextensions_configurator \
        httpie

    jupyter contrib nbextension install --user
    jupyter nbextensions_configurator enable --user
}

function install_pyenv() {
    curl https://pyenv.run | bash
}

install_virtualbox() {
    echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections
    sudo apt install -y virtualbox virtualbox-ext-pack vagrant
    sudo usermod -a -G vboxusers $USER
}

install_docker() {
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    sudo usermod -aG docker $USER
}

install_nodejs() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}
