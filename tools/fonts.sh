#!/usr/bin/env bash

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