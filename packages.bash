#!/bin/bash

'''
DEVELOPERTOOLS FOR LINUX
TODO: add ~./vimrc
'''

set -e

# deb
sudo apt install \
	vim \
	make \
	cmake \
	build-essential \
	gdb \
	git \
	python python3 \
	python-pip python3-pip

# vundle (package manager) for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# get ~/.vimrc from ftp server
vim +PluginInstall +qall

# nvm (node version manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# node
nvm install node
