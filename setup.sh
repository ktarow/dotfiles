#!/bin/bash

if ! type git >/dev/null ; then
    exit 1
fi

if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/ftplugin $HOME/.vim/ftplugin
ln -sf $HOME/dotfiles/filetype.vim $HOME/.vim/filetype.vim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
