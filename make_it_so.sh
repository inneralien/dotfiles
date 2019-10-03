#!/bin/bash

# This script will update a system with Tim's favorite tools and defaults.
# Some of this was take from Matt Daue's dotfiles repo
# https://github.com/mdaue/dotfiles

function update
{
    if [[ -z "$1" ]]; then
        return
    fi
    if [[ -f /usr/bin/git ]]; then
        echo "Updating repository in $1"
        pushd $1
        git pull origin master --quiet
        git submodule update --recursive --quiet
        popd
    fi
}

# VIM
rsync -azP vim/.vimrc $HOME/
vim +PluginInstall +qall

# ZSH
if [[ ! -d $HOME/.oh-my-zsh ]]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	update $HOME/.oh-my-zsh
fi

rsync -azP zsh/.zshrc $HOME/.zshrc

# ZSH Spaceship Theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Oh-my-ZSH

# FZF -- Fuzzy Finder

# The Silver Searcher

# Tmux
