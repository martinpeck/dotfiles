 #!/bin/bash
 
# install fd and fzf
brew install fd fzf

cp ./scripts/fzf_custom.sh ~/.fzf_custom.sh

if grep -q FZF_CUSTOM ~/.zshrc; then
    echo "FZF_CUSTOM already in .zshrc - skipping"
else
    echo "FZF_CUSTOM to .zshrc..."
    echo "# FZF_CUSTOM" >> ~/.zshrc
    echo "source ~/.fzf_custom.sh" >> ~/.zshrc
fi
