#!/bin/bash

FCITX5_CONFIG_DIR="$HOME/.local/share/fcitx5"
FCITX5_THEME_DIR="$FCITX5_CONFIG_DIR/themes"


mkdir -p $FCITX5_THEME_DIR
ln -nsrf ./themes/Material-Color-teal-dark $FCITX5_THEME_DIR
