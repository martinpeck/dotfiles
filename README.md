# Martin Peck's dotfiles

## Remote Container Setup for VS Code

These user settings allow a VS Code Dev Container to automatically clone and use these dotfiles:

``` json
"dotfiles.installCommand": "~/dotfiles/install-devcontainer.sh",
"dotfiles.repository": "https://github.com/martinpeck/dotfiles",    
"dotfiles.targetPath": "~/dotfiles"
```

See <https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories> for more details
