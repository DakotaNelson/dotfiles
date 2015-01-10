#!/bin/sh

# Incredibly blatantly (and poorly) stolen from Evan Morikawa
# https://github.com/emorikawa/dotfiles/blob/master/install.sh

if [ `whoami` == root ]; then
  echo "DONT run this script as root, or using sudo"
  exit
fi


echo ""
echo "**********************************"
echo "* Making your *nix more betterer *"
echo "**********************************"
echo ""

BASEDIR=$(cd "$(dirname "$0")"; pwd)
echo "Basedir: $BASEDIR"

mkdir ~/.vim

echo ""
echo "===> Installing VIM <==="
echo "---> Installing Vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "---> Backing up any previous .vimrc"
cp $HOME/.vimrc $HOME/.vimrc.bak
echo "---> Linking .vimrc"
ln -sf $BASEDIR/vim/vimrc $HOME/.vimrc
echo "---> Linking .vim folder"
ln -sf $BASEDIR/vim/vim $HOME/.vim
echo "---> Installing plugins"
vim +PluginInstall +qall


echo ""
echo "==== All done. Move along. ===="
