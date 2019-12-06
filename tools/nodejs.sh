#!/usr/bin/env bash

# Nodejs Apt Repo
# TODO: Check new version : https://github.com/nodesource/distributions/blob/master/README.md
# TODO: Other Check Main Site : https://nodejs.org/en/
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs

# NVM NodeJs Specifice version installer
# TODO: Check new version : https://github.com/nvm-sh/nvm/releases
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh -o install_nvm.sh
chmod +x install_nvm.sh && ./install_nvm.sh
rm install_nvm.sh

cd ~ && mkdir .node_modules_global
npm config set prefix=$HOME/.node_modules_global

echo export PATH="~/.local/bin/:\$PATH" >>~/.profile >>~/.bashrc
echo export PATH="~/.node_modules_global/bin/:\$PATH" >>~/.profile >>~/.bashrc

source ~/.profile
source ~/.bashrc

# Npm Packages
npm install npm@latest -g
npm rebuild
npm install -g \
  loadtest \
  autocannon \
  artillery \
  k6 \
  nodemon \
  yarn \
  create-react-app \
  @vue/cli \
  @vue/cli-init
#  sass \
#  eslint \
#  prettier \
#  typescript \
#  prettier-stylelint \
#  prettier-eslint \
#  prettier-tslint \
#  purify-css \
