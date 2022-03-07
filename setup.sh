#!/bin/bash

if ! type git >/dev/null ; then
    echo 'You must install git.'
    exit 1
fi

# For Mac
if [ "$(uname)" == 'Darwin' ]; then
    if ! command -v brew >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        echo "installed Homebrew"
        hash -r
    fi
    ln -sf $HOME/dotfiles/Brewfile $HOME/Brewfile
    ln -sf $HOME/dotfiles/Brewfile.lock.json $HOME/Brewfile.lock.json
    brew bundle
fi

# For tmux
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# For neovim
XDG_DATA_HOME="$HOME/.config"
mkdir -p $XDG_DATA_HOME

if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo 'installed vim-plug'
fi

NVIM_HOME=$XDG_DATA_HOME/nvim
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/.vim $NVIM_HOME
ln -sf $HOME/dotfiles/.vimrc $NVIM_HOME/init.vim
ln -sf $HOME/dotfiles/filetype.vim $HOME/.vim/filetype.vim

if [ ! -d $HOME/.vim/ftplugin ]; then
    ln -sf $HOME/dotfiles/ftplugin $HOME/.vim/ftplugin
fi

# For .zshrc
if [ ! -f $HOME/.zprofile ]; then
    touch $HOME/.zprofile
    echo "create $HOME/.zprofile"
fi
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc

# For ctags
ln -sf $HOME/dotfiles/.ctags $HOME/.ctags

# For Perl
ln -sf $HOME/dotfiles/.perltidyrc $HOME/.perltidyrc
