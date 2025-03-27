#!/bin/bash

HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"

# libinput-gesture
ln -srf ./gesture/libinput-gestures.conf "$HOME_CONFIG/libinput-gestures.conf"

echo "Restarting..."
libinput-gestures-setup restart
libinput-gestures-setup autostart start

# fcitx5 themes
bash -c "cd ./fcitx5/ && ./LinkConfig.sh"
