# execute pathogen#infect()
# call pathogen#helptags()

" custom configs
set mouse=a " activate *all* mouse interactions
set number " show line numbers
set tabstop=4 " tabs have 4 spaces
set shiftwidth=4 " automatic shifting
set autochdir " change working directory to where the current file is

" remapping
" enable sudo writing
cmap w!! w !sudo tee > /dev/null %

" lightline
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'default'} " option: solarized

" ########## PLUGIN MANAGER ##########

" VUNDLE {
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'" pre configs

" PLUGINS
Plugin 'ervandew/supertab' " autocompletition
Plugin 'mhinz/vim-startify' " session manager
Plugin 'itchyny/lightline.vim' " custom colors
Plugin 'jiangmiao/auto-pairs' " autoclose opened brackets

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" } VUNDLE
