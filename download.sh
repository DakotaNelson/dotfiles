#!/bin/sh

if [ -d "$HOME/dotfiles" ]; then
  echo "$HOME/dotfiles already exists. You're gonna need to remove that first."
  exit 1
fi

echo "****** Downloading github.com/DakotaNelson/dotfiles ******"
git clone https://github.com/DakotaNelson/dotfiles.git $HOME/dotfiles

cd "$HOME/dotfiles/" && ./setup.sh
