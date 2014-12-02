#!/bin/bash
#
# zsh-setup.sh by Dmitry Nets
# Installs additional files for zsh based on zshrc in dnets/dotfiles

# oh-my-zsh folder
omzfolder=~/.oh-my-zsh

echo "Configuring zsh ..."

# Clone Vundle into ~./vim/bundle/Vundle.vim
echo "Cloning oh-my-zsh into $omzfolder ..."
git clone https://github.com/robbyrussell/oh-my-zsh $omzfolder

echo "Cloning opp.zsh into $omzfolder/custom/plugins ..."
git clone https://github.com/hchbaw/opp.zsh $omzfolder/custom/plugins/opp

echo "All done. Enjoy zsh!"
