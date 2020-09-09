# My Ubuntu Linux Power Up

## Install Default Packages

```bash
# QBittorent Latest
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -yn

# Git Latest
sudo add-apt-repository ppa:git-core/ppa -yn

sudo apt update
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y \
    ubuntu-restricted-extras \
    ubuntu-restricted-addons \
    aria2 \
    asciinema \
    qbittorrent \
    simplescreenrecorder \
    obs-studio \
    ffmpeg \
    git \
    curl \
    wget
```

### Nvidia Latest Driver

```bash
# Latest Nvidia Driver Repo
sudo add-apt-repository ppa:graphics-drivers -y
```

### Typora Markdown Editor

- https://typora.io/

- https://typora.io/#linux

```bash
# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'

sudo apt-get update

# install typora
sudo apt-get install typora
```

### Google Chrome Install

```bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt update
sudo apt install -y google-chrome-stable

# Chrome install after add and conflict repos
sudo rm -f /etc/apt/sources.list.d/google.list
sudo apt update
```

## System Settings

- Append file `/etc/sysctl.conf`

  ```
  ...
  
  fs.inotify.max_user_watches=524288
  vm.swappiness=10
  ```

  ```bash
  # Activate
  sudo sysctl -p
  ```

- Edit file `/etc/fstab`

  `/` root line add "noatime" parameter
  
  ```
  # Before
     8   │ /dev/mapper/vgubuntu-root /               ext4    errors=remount-ro 0       1
  
  # After
   8   │ /dev/mapper/vgubuntu-root /               ext4    noatime,errors=remount-ro 0       1
  ```

- Disk write cache activate

  ```bash
  # Write Cache Status View
  sudo hdparm -W /dev/sda
  
  # Change Cache Status
  sudo hdparm -W1 /dev/sda # Activate
  sudo hdparm -W0 /dev/sda # Deactivate
  ```


## Fonts Install

- Jetbrains font :
  - https://www.jetbrains.com/lp/mono/
  - https://github.com/JetBrains/JetBrainsMono
- Firacode font :
  - https://github.com/tonsky/FiraCode
- Hack font :
  - https://github.com/source-foundry/Hack
  - https://sourcefoundry.org/hack/

```bash
mkdir -p ~/.fonts

# Jetbrains Mono Font
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.002/JetBrainsMono-2.002.zip
unzip JetBrainsMono-2.002.zip -d jetbrains
rm -f JetBrainsMono-2.002.zip
mv jetbrains ~/.fonts/

# Fira Code Font
wget https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip
unzip Fira_Code_v5.2.zip -d firacode
rm -f Fira_Code_v5.2.zip
mv firacode ~/.fonts/

# Hack Font
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip -d hack
rm -f Hack-v3.003-ttf.zip
mv hack ~/.fonts/

# Load all fonts
fc-cache -vf
```

## Development Environment

### Install Default Packages

```bash
sudo apt install -y \
    python3-dev \
    python3-pip \
    python3-venv \
    python3-virtualenv \
    python3-setuptools \
    python3-distutils \
    python3-testresources \
    python3-launchpadlib \
    build-essential \
    default-jdk \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common \
    silversearcher-ag \
    htop \
    bat
```

### Git Settings

```bash
git config --global user.name "Your Full Name"
git config --global user.email "Your Email Address"
git config --global core.editor "code --wait"
git config --global credential.helper store
```

#### P4 Merge Diff Tool Install

```bash
wget https://cdist2.perforce.com/perforce/r20.2/bin.linux26x86_64/p4v.tgz
tar zxvf p4v.tgz
sudo cp -r p4v-* /usr/local/p4v/
rm -r p4v*
sudo ln -s /usr/local/p4v/bin/p4merge /usr/local/bin/p4merge
```

```bash
# Git Integrate External Diff Tool
git config --global diff.tool p4merge
git config --global difftool.p4merge.path /usr/local/bin/p4merge
git config --global difftool.prompt false

git config --global merge.tool p4merge
git config --global mergetool.p4merge.path /usr/local/bin/p4merge
git config --global mergetool.prompt false
```

### Visual Studio Code Install

- https://code.visualstudio.com/docs/setup/linux

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg

sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/

sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

sudo apt update
sudo apt install -y code
```

### Sublime Install

```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update
sudo apt install -y \
	sublime-merge \
	sublime-text
```

### Golang Latest Install

- Latest PPA Repo : https://launchpad.net/~longsleep/+archive/ubuntu/golang-backports

```bash
sudo add-apt-repository ppa:longsleep/golang-backports -yn
sudo apt-get update

# Install latest version
sudo apt install golang-go
```

### Python Pyenv Install

Build python requirement package:

- https://github.com/pyenv/pyenv/wiki/Common-build-problems
- https://github.com/pyenv/pyenv/wiki

```bash
sudo apt-get install -y \
	build-essential \
	make \
	libssl-dev \
	zlib1g-dev \
	libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
	llvm \
	libncurses5-dev \
	libncursesw5-dev \
	xz-utils \
	tk-dev \
	libffi-dev \
	liblzma-dev \
	python3-openssl \
	git \
	libxml2-dev \
	libxmlsec1-dev
```

Pyenv Install :

- https://github.com/pyenv/pyenv-installer

```bash
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

Restart shell take effect

```bash
# Python Improvment Speed
# add line .bashrc
export CFLAGS='-O2'

exec $SHELL
```

Install example version :

```bash
# list all version
pyenv install --list

# -v verbose output
pyenv install 3.8.5 -v

# activate
pyenv global 3.8.5
```

Recommended pip packages install :

```bash
# Upgrade Pip Package
pip install -U --force-reinstall \
	pip \
	setuptools

# Recommended Package
pip install -U --force-reinstall \
	virtualenv \
	pip-check \
	poetry \
	httpie \
	ipython \
	black \
	pylint \
	jupyter \
	jupyter_contrib_nbextensions \
	jupyter_nbextensions_configurator

# Jupyter Extensions Install
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
```

### Docker Install

- https://docs.docker.com/engine/install/ubuntu/
- https://docs.docker.com/compose/install/
- https://docs.docker.com/machine/install-machine/

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository -y \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# Docker Install
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Docker Compose Install
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Docker Machine Install
base=https://github.com/docker/machine/releases/download/v0.16.0 && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && sudo mv /tmp/docker-machine /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine

# Docker use permission user
sudo usermod -aG docker $USER
```

#### CTop Tools

- https://ctop.sh/

- https://github.com/bcicen/ctop

```bash
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.3/ctop-0.7.3-linux-amd64 -O /usr/local/bin/ctop

sudo chmod +x /usr/local/bin/ctop
```

#### Dive Tools

- https://github.com/wagoodman/dive

```bash
wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb

sudo apt install -y ./dive_0.9.2_linux_amd64.deb

rm -f ./dive_0.9.2_linux_amd64.deb
```

### Virtualbox Latest Install

- https://www.virtualbox.org/wiki/Linux_Downloads

```bash
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian focal contrib"

sudo apt update
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections
sudo apt install -y \
	virtualbox-6.1 \
	virtualbox-ext-pack

sudo usermod -aG vboxusers $USER
```

#### Vagrant Install

- https://www.vagrantup.com/docs/installation#linux-virtualbox-and-kvm
- https://www.vagrantup.com/downloads

```bash
# Remove kvm kernel mode
lsmod | grep kvm

# Run Root Mode
echo 'blacklist kvm-intel' >> /etc/modprobe.d/blacklist.conf

# Install
wget https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.deb
sudo apt install -y ./vagrant_2.2.10_x86_64.deb

# Vagrant Plugin
vagrant plugin install vagrant-vbguest
```