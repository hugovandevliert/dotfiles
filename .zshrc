export ZSH="$HOME/.oh-my-zsh"

# Nice themes: sunaku, sunrise, simple, kolo, gozilla, fletcherm, eastwood, dst
ZSH_THEME="simple"

plugins=(brew git gpg-agent mise)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export LANG="en_US.UTF-8"
export MANPAGER='nvim +Man!'
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_OPTS="--no-mouse --color=fg+:#fdf6e3,bg+:#5d6d6f,pointer:#fdf6e3,marker:#859900,gutter:-1,prompt:-1"
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=14
export HOMEBREW_NO_ENV_HINTS=YES

# These should start working on the next version of bat (see: https://github.com/sharkdp/bat/pull/3168)
# export BAT_THEME_LIGHT="Solarized (light)"
# export BAT_THEME_DARK="Solarized (dark)"
export BAT_THEME="$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo 'Solarized (dark)' || echo 'Solarized (light)')"

# Prevent some regularly used commands from being added to ~/.zsh_history
HISTORY_IGNORE="(clear|dot|ls|vi|vim|fg|gs|gd|gl|gf|gds|gc|gaa|gca)"

# Increase history size
HISTSIZE=100000
SAVEHIST=100000

alias cat="bat"
alias df="df -h"
alias dot="cd ~/dev/dotfiles"
alias gbd="git branch -D"
alias gs="git status"
alias vi="nvim"

# Open a Pull Request for the current branch against master/main on github.com
function gopr() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    github_url=`git ls-remote --get-url | sed -Ee "s#(git@|git://)#https://#" -e "s@com:@com/@" -e "s%\.git$%%"`
    open $github_url"/compare/"$(git_main_branch)"..."$(git_current_branch)"?expand=1"
  else
    echo "not in a git repository"
  fi
}
