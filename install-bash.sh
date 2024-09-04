 #!/bin/bash

BASE_DIR=$(dirname "$0")
BASE_DIR=$(cd $BASE_DIR; pwd)

# setup .bashrc
if grep -q DOTFILES_START ~/.bashrc; then
    echo "dotfiles loader already in .bashrc - skipping"
else
    echo "Adding dotfiles loader to .bashrc..."
    echo -e "# DOTFILES_START" >> ~/.bashrc
    if [[ -n $DEV_CONTAINER ]]; then
        echo -e "DEV_CONTAINER=1" >> ~/.bashrc
    fi
    echo -e "source \"$BASE_DIR/load.sh\"" >> ~/.bashrc
    echo -e "# DOTFILES_END\n" >> ~/.bashrc
fi

# Install azbrowse
if [[ $(command -v azbrowse > /dev/null; echo $?) == 1 ]]; then
    echo "Installing azbrowse"
    mkdir -p ~/bin
    export AZBROWSE_LATEST=$(wget -O - -q https://api.github.com/repos/lawrencegripper/azbrowse/releases/latest | grep 'browser_' | cut -d\" -f4 | grep linux_amd64.tar.gz)
    wget "$AZBROWSE_LATEST"
    tar -C ~/bin -zxvf azbrowse_linux_amd64.tar.gz azbrowse
    chmod +x ~/bin/azbrowse
    rm azbrowse_linux_amd64.tar.gz
fi

# Install tree
if [[ $(command -v tree > /dev/null; echo $?) == 1 ]]; then
    echo "Installing tree"
    sudo apt update && sudo apt install -y tree
fi

echo "Done"