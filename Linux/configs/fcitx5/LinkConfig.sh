#!/bin/bash

FCITX5_CONFIG_DIR="$HOME/.local/share/fcitx5"
FCITX5_THEME_DIR="$FCITX5_CONFIG_DIR/themes"

WAYLAND_CONFIG_ENVDIRS="$HOME/.config/environment.d/"

mkdir -p $FCITX5_THEME_DIR
ln -nsrf ./themes/Material-Color-teal-dark $FCITX5_THEME_DIR

mkdir -p "$WAYLAND_CONFIG_ENVDIRS"
ln -srf wayland-envvars.conf "$WAYLAND_CONFIG_ENVDIRS"
