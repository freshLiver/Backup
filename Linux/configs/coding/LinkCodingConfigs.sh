#!/bin/bash
HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"

# .clang-format TODO

# VSCode
bash -c "cd ./VSCode/ && ./LinkVSCodeConfigs.sh"

# vim -- .vimrc and .vim/colors
VIM_THEME_DIR="$HOME/.vim/"
mkdir -p "$VIM_THEME_DIR"

ln -srf ./vim/.vimrc "$HOME/.vimrc"
ln -nsrf ./vim/colors/ "$VIM_THEME_DIR"

# batcat -- whole directory
ln -nsrf ./bat/ "$HOME_CONFIG"