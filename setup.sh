#!/usr/bin/env bash

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle
brew cleanup

echo "Configuring macOS settings..."
sh .macos

echo "Creating Code directory..."
mkdir ~/Code

echo "Linking dotfiles..."
sh link.sh

echo "Configuring git..."
git config --global user.name "Hugo van de Vliert"
git config --global user.email hvandevliert@icloud.com
git config --global core.editor vim
git config --global pull.ff only
git config --global pull.rebase true
git config --global commit.gpgsign true
git config --global gpg.program gpg

echo "Configuring vim..."
cp -r .vim ~/.vim
vim +PlugInstall +qa!

echo "Installation complete!"
