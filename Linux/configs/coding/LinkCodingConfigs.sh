#!/bin/bash

# .clang-format TODO

# VSCode
bash -c "cd ./VSCode/ && ./LinkVSCodeConfigs.sh"

# vim -- .vimrc and .vim/colors
VIM_THEME_DIR="$HOME/.vim/"
mkdir -p "$VIM_THEME_DIR"

ln -srf ./vim/.vimrc "$HOME/.vimrc"
ln -nsrf ./vim/colors/ "$VIM_THEME_DIR"