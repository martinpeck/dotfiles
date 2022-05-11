#!/bin/bash

export PATH=$PATH:~/bin:~/.local/bin

source "$DOTFILES_FOLDER/aliases/load.sh"

if (command -v git > /dev/null); then
    source "$DOTFILES_FOLDER/git/load.sh"
fi