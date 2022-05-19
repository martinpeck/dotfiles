#!/bin/bash


script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# set up global gitignore
git config --global core.excludesfile "${script_dir}/.gitignore_global"

# only set config outside of dev containers
if [[ -z "${DEV_CONTAINER}" ]]; then

    git config --global --replace-all core.editor "code --wait"

    git config --global diff.tool default-difftool
    git config --global difftool.default-difftool.cmd 'code --wait --diff $LOCAL $REMOTE'

    git config --global --replace-all alias.undo 'reset HEAD~1 --mixed'
    git config --global --replace-all alias.wip '!git add -A && git commit -qm WIP'
    git config --global --replace-all alias.amendcommit '!git commit --amend --reuse-message "$(git rev-parse --abbrev-ref HEAD)"'
    git config --global --replace-all alias.xwipe '!git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'

    git config --global --replace-all alias.branches 'branch -a --color -vv'
    git config --global --replace-all alias.ls 'log --pretty=format:%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn] --decorate'
    git config --global --replace-all alias.logtree 'log --graph --oneline --decorate --all'
    git config --global --replace-all alias.overwrite-local-with-remote '! f() { echo starting...;CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD); REMOTE_BRANCH=$(git for-each-ref --format="%(refname:short):%(upstream:short)" refs/heads | grep $CURRENT_BRANCH: | sed -E "s/.*:(.*)/\\1/"); echo Checking out $REMOTE_BRANCH;git checkout $REMOTE_BRANCH;echo Checking out as $CURRENT_BRANCH; git checkout -B $CURRENT_BRANCH ;}; f'
    git config --global --replace-all alias.rup 'remote update --prune'
    git config --global --replace-all alias.show-remote '! f() { CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD); REMOTE_BRANCH=$(git for-each-ref --format="%(refname:short):%(upstream:short)" refs/heads | grep $CURRENT_BRANCH: | sed -E "s/.*:(.*)/\\1/"); echo Remote tracking branch for $CURRENT_BRANCH is $REMOTE_BRANCH; }; f'

fi