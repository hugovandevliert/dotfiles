export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(brew git mise)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export LANG="en_US.UTF-8"

# FZF settings
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_OPTS="--no-mouse --color=fg+:#fdf6e3,bg+:#5d6d6f,pointer:#fdf6e3,marker:#859900,gutter:-1,prompt:-1"

# BAT settings
export BAT_THEME="$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo 'Solarized (dark)' || echo 'Solarized (light)')"
alias cat="bat"

# Prevent some regularly used commands from being added to ~/.zsh_history
HISTORY_IGNORE="(dot|ls|vim|fg|gs|gd|gl|gf|gds|gc|gca)"

# Increase history size
HISTSIZE=100000
SAVEHIST=100000

# Use human readable sizes
alias df="df -h"

# Custom aliases
alias dot="cd ~/dev/dotfiles"
alias gbd="git branch -D"
alias gs="git status"

# Get main branch name of the current repository (assumes it's either 'master' or 'main')
function git_main_branch() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    git branch | cut -c 3- | grep -E '^master$|^main$'
  fi
}

# Open a Pull Request for the current branch against master/main on github.com
function gopr() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    github_url=`git ls-remote --get-url | sed -Ee "s#(git@|git://)#https://#" -e "s@com:@com/@" -e "s%\.git$%%"`
    open $github_url"/compare/"$(git_main_branch)"..."$(git_current_branch)"?expand=1"
  else
    echo "not in a git repository"
  fi
}
