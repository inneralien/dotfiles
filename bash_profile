alias ls='ls -pG'
alias l='ls -ltrp'
alias v='vim'
set -o vi
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias gitl='git log --all --graph --decorate --oneline'
alias tree='tree -C'
alias grep='grep --color=always'

# LS_COLORS is to color the tree command
export LS_COLORS="di=01;91"

export PATH=~/bin/:$PATH

## Git Flow
source ~/bin/git-completion.bash

#export PS1='\[\033[1;31m\]\h\[\033[0m\]:\W/\[\033[0;34m\]$(__git_ps1 " (%s)")\[\033[0m\]$ '
export PS1='ð  \W/\[\033[0;34m\]$(__git_ps1 " (%s)")\[\033[0m\]$ '


#rocket
#Unicode: U+1F680, UTF-8: F0 9F 9A 80

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:"/Applications/microchip/xc32/v2.15/bin""
