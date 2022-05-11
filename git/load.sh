#!/bin/bash


script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# set up global gitignore
git config --global core.excludesfile "${script_dir}/.gitignore_global"