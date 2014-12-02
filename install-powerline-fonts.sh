#!/bin/bash
#
# install-powerline-fonts.sh
# Installs powerline font pack

# VARIABLES
download_folder=~/install/powerline-fonts

# Clone Vundle into ~./vim/bundle/Vundle.vim
echo "Installing Powerline font pack ..."
echo "Downloading fonts into $download_folder ..."
git clone https://github.com/lokaltog/powerline-fonts.git $download_folder

# Install fonts
echo "Running font installation script ..." && sudo $download_folder/install.sh

# END SCRIPT
