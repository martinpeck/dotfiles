#!/bin/bash

export PATH=$PATH:~/bin:~/.local/bin

source "~/dotfiles/aliases/load.sh"

if (command -v git > /dev/null); then
    source "~/dotfiles/git/load.sh"
fi