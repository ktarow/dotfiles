#!/bin/bash

if ! type git >/dev/null ; then
    exit 1
fi

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir -p ~/.vim/indent
ln -sf $HOME/dotfiles/indent/ruby.vim $HOME/.vim/indent/ruby.vim
