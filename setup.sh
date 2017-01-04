#!/bin/bash

if ! type git >/dev/null ; then
    echo 'You must install git.'
    exit 1
fi

if [ ! -d $HOME/.vim/dein ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
    sh /tmp/installer.sh $HOME/.vim/dein
    echo 'installed dein'
fi

ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
if [ ! -d $HOME/.vim/ftplugin ]; then
    ln -sf $HOME/dotfiles/ftplugin $HOME/.vim/ftplugin
fi
ln -sf $HOME/dotfiles/filetype.vim $HOME/.vim/filetype.vim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.ctags $HOME/.ctags
