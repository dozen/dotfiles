#!/bin/bash

DOTFILES=$(cd $(dirname $0); pwd)

recursive() {
    if [ ! -e ${HOME}/${1} ]; then
        mkdir ${HOME}/${1}
    fi

    for DOTFILE in ${1}/?*; do
        if [ -d ${DOTFILE} ]; then
            recursive ${DOTFILE}
        else
            linker ${DOTFILE}
        fi
    done
}

linker() {
    echo ${1}
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
