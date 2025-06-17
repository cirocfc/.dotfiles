#!/bin/bash

set -e

copy_file() {
  if [ -f "$1" ]; then
    cp -f "$1" "$2"
  fi
}

copy_dir() {
  if [ -d "$1" ]; then
    cp -rf "$1" "$2"
  fi
}

copy_file $HOME/.zshrc $MY_DOTFILES/files/.zshrc
copy_file $HOME/.aws/config $MY_DOTFILES/files/.aws/config
copy_file $HOME/.gitconfig $MY_DOTFILES/files/.gitconfig
copy_file $HOME/.kube/config $MY_DOTFILES/files/.kube/config
copy_dir $HOME/.oh-my-zsh $MY_DOTFILES/files/.oh-my-zsh
