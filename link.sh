#!/bin/bash

DOTFILES=$(cd $(dirname $0); pwd)

ln -sf ${DOTFILES}/.bash_profile ${HOME}/
ln -sf ${DOTFILES}/.config/nvim/init.vim ${HOME}/.config/nvim/
ln -sf ${DOTFILES}/.config/git/git-completion.bash ${HOME}/.config/git/
