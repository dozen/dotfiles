#!/bin/bash

DOTFILES=$(cd $(dirname $0); pwd)

recursive() {
    for DOTFILE in ${1}/.?* ${1}/?*; do
        if [ ${DOTFILE} != "${1}/.." ]; then
            if [ -d ${HOME}/${DOTFILE} ]; then
                if [ ! -e ${HOME}/${DOTFILE} ]; then
                    echo mkdir ${HOME}/${$DOTFILE}
                fi
                recursive ${DOTFILE}
            else
                linker ${DOTFILE}
            fi
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
