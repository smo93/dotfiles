#!/bin/bash

################################################################################
# This script creates symlinks from the home dir to some dotfiles              #
################################################################################

# Variables

dir=~/.dotfiles
olddir=~/.dotfiles_old
files="bashrc vimrc vim"

#########################

# create .dotfiles_old to backup any existing dotfiles
echo "Creating $olddir to back up any existing dotfiles in ~"
mkdir -p $olddir
echo "...done."

# changing to the .dotfiles dir
echo "Changing to the $dir directory"
cd $dir
echo "...done."

# move any existing dotfile from the ~ dir and create the sym links
for file in $files; do
    echo "Moving existing dotfiles from ~ to $olddir."
    mv ~/.$file $olddir
    echo "Creating symlink for $file in home dir."
    ln -s $dir/$file ~/.$file
done

# install vim plugins
vim +BundleClean +BundleInstall +BundleUpdate +qall
