#!/usr/bin/env bash

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle
brew cleanup

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configuring macOS settings..."
sh .macos

echo "Creating Code directory..."
mkdir ~/Code

echo "Linking dotfiles..."
sh link.sh

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

echo "Configuring vim..."
cp -R .vim/ ~/.vim
vim +PlugInstall +qa!

echo "Installation complete! Please reboot your machine."
