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

# get .vimrc from repository
user="philippe-ancsin"
repository="deb-bootstrap"
branch="master"
raw_file=".vimrc"
tmp_path="/tmp/"$raw_file
dest_path="~/.vimrc"
curl -o $tmp_path https://raw.githubusercontent.com/$user/$repository/$branch/$raw_file
cp $get_path $dest_path

vim +PluginInstall +qall

# nvm (node version manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# node
nvm install node
