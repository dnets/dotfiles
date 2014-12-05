#!/bin/bash
#
# vim-config.sh
# Configures vim based on vimrc in dnets/dotfiles

echo "Configuring vim ..."

echo "Cloning Vundle into ~./vim/bundle/Vundle.vim ..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install registered Vundle plugins
echo "Installing registered Vundle plugins ..." && vim +PluginInstall +qall && echo "... done!"
echo "All done. Enjoy vim!"
