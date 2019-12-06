#!/usr/bin/env bash

# Git P4Merge Visual Merge Tool
# TODO: Check new version : https://www.perforce.com/downloads/perforce/
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
# TODO: Check new version : https://github.com/isacikgoz/gitbatch/releases
curl -OL https://github.com/isacikgoz/gitbatch/releases/download/v0.5.0/gitbatch_0.5.0_linux_amd64.tar.gz
tar xzf gitbatch_0.5.0_linux_amd64.tar.gz
mv gitbatch ~/.local/bin/
rm ~/gitbatch_0.5.0_linux_amd64.tar.gz

# SmartGit
wget -q https://www.syntevo.com/downloads/smartgit/smartgit-19_1_5.deb
sudo dpkg -i smartgit*.deb
rm smartgit*.deb
sudo apt --fix-broken install -y
