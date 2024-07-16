OS=`uname -s`

# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_SHOW_FULL=true
SPACESHIP_VENV_SYMBOL="🐍 "
SPACESHIP_VENV_GENERIC_NAMES="()"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
#SPACESHIP_PROMPT_PREFIXES_SHOW=true
#SPACESHIP_PROMPT_DEFAULT_PREFIX="╭─"
#SPACESHIP_PROMPT_DEFAULT_SUFFIX="╭─"
#SPACESHIP_CHAR_COLOR_SUCCESS=""
#SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_DIR_PREFIX="╭─○ "
#SPACESHIP_DIR_PREFIX="╭∊ "
#SPACESHIP_DIR_PREFIX="╭🍄 "
#SPACESHIP_DIR_PREFIX=" "
SPACESHIP_CHAR_PREFIX="╰─"
#SPACESHIP_CHAR_SYMBOL="○ "
SPACESHIP_CHAR_SYMBOL="𝝨 "
#SPACESHIP_CHAR_SYMBOL="𝝣 "
#SPACESHIP_CHAR_SYMBOL="→ "
SPACESHIP_RUST_SHOW=true
SPACESHIP_PROMPT_ORDER=(dir host venv git exec_time line_sep char)

#ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  rust
  docker
  docker-compose
  git
  vi-mode
  zsh-autosuggestions
  #ssh-agent
  #virtualbox
  #expand-aliases
  globalias
  #virtualenvwrapper
  virtualenv
)

zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent lazy

# Justfile completion
# Init Homebrew, which adds environment variables
# eval "$(brew shellenv)"

# fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

# Then choose one of these options:
# 1. If you're using Oh My Zsh, you can initialize it here
# source $ZSH/oh-my-zsh.sh

# 2. Otherwise, run compinit yourself
# autoload -U compinit
# compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# Don't share command history between terminals
#unsetopt inc_append_history
#unsetopt share_history
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

#source $HOME/bin/virtualenv-autodetect.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias l='ls -ltrp'
alias eza='eza -F'
alias l='eza --long -snew'
alias la='eza --long --git -a -snew'
#alias la='ls -altrp'
alias v='nvim'
#alias nv='nvim'
alias miniterm='miniterm.py --raw --eol=lf'
alias mt='miniterm /dev/tty.usbserial 115200'
alias javar='/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java'
# alias gitla='git log --all --pretty --graph --oneline'
alias gitla='git log --pretty --graph --oneline --all'
alias gitl='git log --pretty --graph --oneline'
alias nv='/Applications/Neovide.app/Contents/MacOS/neovide --multigrid --notabs'
GLOBALIAS_FILTER_VALUES=(l la nv)

# Disable shell integration because it doesn't work properly with TMux
#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# .net Project Aliases

#alias updev='CURBRANCH=`git rev-parse --abbrev-ref HEAD`; git checkout develop; git pull origin develop; git checkout $CURBRANCH'
#alias rpkg='~/.dotnet/tools/paket restore; dotnet restore'
#alias uppkg='~/.dotnet/tools/paket update; dotnet restore'
#alias ipkg='~/.dotnet/tools/paket install; dotnet restore'
#alias b='dotnet build'
#alias bf21='dotnet build --framework netcoreapp2.1'
#alias nuke='cd src && git clean -xfd && cd .. && dotnet restore'
#alias paket='~/.dotnet/tools/paket'

# Apalache Aliases
###### using the latest stable

#alias apalache='docker run --rm -v $(pwd):/var/apalache ghcr.io/informalsystems/apalache'

###### using the latest main

#alias apalache_latest='docker run --rm -v $(pwd):/var/apalache ghcr.io/informalsystems/apalache:main'

# TLA+ Toolbox
#alias tlc="java -jar /Applications/TLA+\ Toolbox.app/Contents/Eclipse/tla2tools.jar"


# AutoJump
#if [ "$OS" = "Darwin" ]; then
#    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
#else
#    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
#fi


# Fuzzy Find FTW!!
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use Most pager for colors
#if command -v most > /dev/null 2>&1; then
#    export PAGER="most"
#fi

# Bind Ctrl-space to accept Autosuggest 
bindkey '^ ' autosuggest-accept

# Auto activate Python VENVs
#if [[ -x ~/bin/virtualenv-autodetect.sh ]]; then
#    source ~/bin/virtualenv-autodetect.sh
#fi

# Pyenv
#if which pyenv-virtualenv-init > /dev/null; then
#    eval "$(pyenv virtualenv-init -)";
#fi
#
#if which pyenv > /dev/null; then
#    eval "$(pyenv init -)";
#fi

