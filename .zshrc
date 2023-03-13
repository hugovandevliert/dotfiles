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

# Prevent some regularly used commands from being added to ~/.zsh_history
HISTORY_IGNORE="(dot|ls|vim|fg|gs|gd|gl|gf|gds)"

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

# Open a Pull Request for the current branch against master on github.com
function gopr() {
  github_url=`git ls-remote --get-url | sed -Ee "s#(git@|git://)#https://#" -e "s@com:@com/@" -e "s%\.git$%%"`
  main_branch=`git branch | cut -c 3- | grep -E '^master$|^main$'`
  current_branch=$(git_current_branch)
  open $github_url"/compare/"$main_branch"..."$current_branch"?expand=1"
}
