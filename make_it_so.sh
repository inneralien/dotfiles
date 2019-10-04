#!/bin/bash

# This script will update a system with Tim's favorite tools and defaults.
# Some of this was take from Matt Daue's dotfiles repo
# https://github.com/mdaue/dotfiles

# Add some color
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
bold=`tput bold; tput setaf 7`
reset=`tput sgr0`

die() {
    echo "${red}DIED: ${bold}$1${reset}"
    exit 1
}


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

# Figure out which OS we might be on based on the package manager
if [[ -f /usr/bin/apt-get ]]; then
    PM="apt-get"
elif [[ -f /usr/bin/yum || -f /usr/bin/dnf ]]; then
    PM="yum"
elif [[ -f /sbin/apk ]]; then
    PM="apk"
elif [[ -f /usr/local/bin/brew ]]; then
    PM="brew"
else
    echo "Error determining package manager"
    PM="UNKNOWN"
fi

# Update bin/ dir
rsync -azP bin/ $HOME/bin/

# VIM
function install_vim_files
{
	if [[ ! -d $HOME/.vim ]]
	then
		echo "Installing VIM config and plugins"
		rsync -azP vim/.vimrc $HOME/
		vim +PluginInstall +qall
	fi
}

# ZSH
function install_zsh
{
	echo "Installing ZSH"
	if [[ $PM == "yum" ]]; then sudo yum install zsh; fi
}

# Oh-my-ZSH
function install_ohmyzsh
{
	echo "Installing Oh-My-ZSH"
	if [[ ! -d $HOME/.oh-my-zsh ]]; then
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	else
		update $HOME/.oh-my-zsh
	fi

}


# ZSH Spaceship Theme
function install_spaceship_theme
{
	if [ -z "$ZSH_CUSTOM" ]
	then
		echo "Exporting ZSH_CUSTOM env var"
		export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
	fi

	echo "Installing Oh-My-ZSH Spaceship Theme"
	if [ ! -d $ZSH_CUSTOM/themes/spaceship-prompt ]
	then
		"Cloning Oh-My-ZSH Spaceship Theme"
		git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
	fi

	if [ ! -f $ZSH_CUSTOM/themes/spaceship.zsh-theme ]
	then
		ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	fi
	rsync -azP zsh/.zshrc $HOME/.zshrc
}


# FZF -- Fuzzy Finder

# The Silver Searcher

# Tmux

install_vim_files || die "Can't install VIM files"
#install_zsh && install_ohmyzsh && install_spaceship_theme || die "Can't install ZSH"
install_spaceship_theme || die "Can't install spaceship theme"
