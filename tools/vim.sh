#!/usr/bin/env bash

# Vim Latest
sudo add-apt-repository ppa:jonathonf/vim -yn

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable -yn

sudo apt update
sudo apt install vim neovim

# Vim Configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Neovim Install
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/utkuufuk/ubuntu-on-steroids/master/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim ~/.config/nvim/init.vim +:PlugInstall +qall
