#!/usr/bin/env bash

dir=$HOME
files=".vimrc .zshrc"

for file in $files; do
  echo "Creating symlink for $file in $dir."
  ln -sfn "$PWD/$file" "$dir/$file"
done
