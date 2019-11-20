#!/bin/bash

rm -rf $HOME/.vimrc $HOME/.vim
cp ./.vimrc $HOME
mkdir -p $HOME/.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [[ $(uname) == "Darwin" ]]; then
    cp ./.tmux-osx.conf $HOME/.tmux.conf
else
    cp ./.tmux-linux.conf $HOME/.tmux.conf
fi

cp ./.gitconfig $HOME

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

