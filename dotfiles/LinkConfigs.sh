# !/bin/bash
HOME_CONFIG="$HOME/.config"
mkdir -p "$HOME_CONFIG"

# tmux -- .tmux.conf only
ln -srf ./shell/.tmux.conf "$HOME/.tmux.conf"

# polybar -- config.ini only
POLYBAR_CONFIG_DIR="$HOME_CONFIG/polybar"
mkdir -p "$POLYBAR_CONFIG_DIR"

ln -srf ./polybar/miko.ini "$POLYBAR_CONFIG_DIR/config.ini"

# rofi -- whole directory
ln -srf ./rofi/ "$HOME_CONFIG"

# mpv -- whole directory
ln -srf ./mpv/ "$HOME_CONFIG"
