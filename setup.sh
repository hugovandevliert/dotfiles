#!/usr/bin/env bash

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off
brew bundle --no-lock
brew cleanup

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sfn "$PWD.zshrc" "$HOME/.zshrc"

echo "Creating Code directory..."
mkdir ~/Code

echo "Configuring macOS settings..."
sh .macos

echo "Configuring git..."
git config --global commit.gpgsign true
git config --global core.editor vim
git config --global core.ignorecase false
git config --global gpg.program gpg
git config --global merge.tool vimdiff
git config --global pull.ff only
git config --global pull.rebase true
git config --global user.email hvandevliert@icloud.com
git config --global user.name "Hugo van de Vliert"
git config --global user.signingkey "CHANGE_ME"

echo "Configuring iTerm..."
mkdir ~/.iterm2
ln -sfn "$PWD/.iterm2/com.googlecode.iterm2.plist" "$HOME/.iterm2/com.googlecode.iterm2.plist"

echo "Configuring vim..."
cp -R .vim/ ~/.vim
ln -sfn "$PWD/.vimrc" "$HOME/.vimrc"
vim +PlugInstall +qa!

echo "Installation complete! Please reboot your machine."
