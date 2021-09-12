#!/usr/bin/env bash

dir=$HOME
files=".vimrc .zshrc"

for file in $files; do
  echo "Creating symlink for $file in $dir."
  ln -s "$PWD/$file" "$dir/$file"
done
