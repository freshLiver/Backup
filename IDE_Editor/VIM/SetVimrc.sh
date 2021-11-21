#!/bin/bash

# mkdirs
mkdir ~/.vim/
mkdir ~/.vim/bundle
mkdir ~/.vim/colors

# link(overwrite) vimrc and color theme file
ln -srf ./jummidark.vim ~/.vim/colors/jummidark.vim
ln -srf ./vimrc.k21 ~/.vimrc

# go to vim plugins
cd ~/.vim/bundle/


# install vundle if not exists
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim
else
    echo "Vundle Already Installed !"
fi
