#!/bin/bash

HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"

# mpv
ln -nsrf ./mpv/ "$HOME_CONFIG"

# deadbeef
ln -nsrf ./deadbeef/ "$HOME_CONFIG"