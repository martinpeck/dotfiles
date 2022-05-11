# Martin Peck's dotfiles

## Remote Container Setup for VS Code

These user settings allow a VS Code Dev Container to automatically clone and use these dotfiles:

``` json
"remote.containers.dotfiles.installCommand": "~/dotfiles/install-devcontainer.sh",
"remote.containers.dotfiles.repository": "https://github.com/martinpeck/dotfiles",    
"remote.containers.dotfiles.targetPath": "~/dotfiles"
```

See <https://code.visualstudio.com/docs/remote/containers#_personalizing-with-dotfile-repositories> for more details
