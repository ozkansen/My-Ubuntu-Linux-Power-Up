#!/usr/bin/env bash

# Terminix
sudo add-apt-repository ppa:webupd8team/terminix -yn

sudo apt update
sudo apt install tilix


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