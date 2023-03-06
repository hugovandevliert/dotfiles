export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG="en_US.UTF-8"

# Preferred editor for local and remote sessions
export EDITOR="vim"

# FZF settings
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_OPTS="--no-mouse"

# Github GPG
export GPG_TTY=$(tty)

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi

# pyenv
if which pyenv > /dev/null; then
  PATH=$(pyenv root)/shims:$PATH
fi

# Custom aliases
alias dot="cd ~/code/dotfiles"
alias gbd="git branch -D"
alias gs="git status"
