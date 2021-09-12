# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# pyenv
if which pyenv > /dev/null; then
  PATH=$(pyenv root)/shims:$PATH
fi

# Custom git commands
alias gs="git status"
alias gdc="git diff --cached"
alias gbd="git branch -D"
alias glog="git log --oneline --decorate --graph --all"

# Github GPG
export GPG_TTY=$(tty)

# Don't enter autocomplete menu when pressing tab twice
setopt noautomenu
setopt nomenucomplete
