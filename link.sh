#!/bin/bash

DOTFILES=$(cd $(dirname $0); pwd)

recursive() {
    if [ ! -e ${HOME}/${1} ]; then
        mkdir ${1}
    fi

    for dotfile in ${1}/?*; do
        if [ -d ${dotfile} ]; then
            recursive ${dotfile}
        else
            linker ${dotfile}
        fi
    done
}

linker() {
    ln -sf ${DOTFILES}/${1} $HOME/${1}
}

for DOTFILE in .?*; do
    if [ ${DOTFILE} != ".." ] && [ ${DOTFILE} != ".git" ]; then
        if [ -d ${DOTFILE} ]; then
            recursive ${DOTFILE}
        else
            linker ${DOTFILE}
        fi
    fi
done
