#!/bin/sh

# Incredibly blatantly (and poorly) stolen from Evan Morikawa
# https://github.com/emorikawa/dotfiles/blob/master/install.sh

if [ `whoami` == root ]; then
  echo "DO NOT run this script as root, or using sudo"
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
echo "===> Configuring Git <==="
echo "---> Backing up any previous .gitconfig"
cp $HOME/.gitconfig $HOME/.gitconfig.bak
echo "---> Linking gitconfig"
ln -sf $BASEDIR/.gitconfig $HOME/.gitconfig

echo ""
echo "===> Installing VIM <==="
echo "---> Installing Vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "---> Backing up any previous .vimrc"
cp $HOME/.vimrc $HOME/.vimrc.bak
echo "---> Linking .vimrc"
ln -sf $BASEDIR/vim/vimrc $HOME/.vimrc
echo "---> Linking .vim/colors"
ln -sf $BASEDIR/vim/colors $HOME/.vim/colors
#ln -sf $BASEDIR/vim/vim $HOME/.vim
echo "---> Installing plugins"
vim +PluginInstall +qall

echo ""
echo "===> Importing Fonts <==="
mkdir -p $HOME/.fonts
# link all the fonts!
find $BASEDIR/fonts/anonymouspro/*.ttf -exec ln -sf {} $HOME/.fonts \;
fc-cache -f

echo ""
echo "===> Setting up Bash <==="
# set up bashrc
cp $HOME/.bashrc $HOME/.bashrc.bak
ln -sf $BASEDIR/bash/.bashrc $HOME/.bashrc
# set up bash_profile
cp $HOME/.bash_profile $HOME/.bash_profile.bak
ln -sf $BASEDIR/bash/.bash_profile $HOME/.bash_profile
# don't tell anyone about the illuminati
cp $HOME/.bashrc.secrets $HOME/.bashrc.secrets.bak
ln -sf $BASEDIR/bash/.bashrc.secrets $HOME/.bashrc.secrets


echo ""
echo "==== All done. Move along. ===="
