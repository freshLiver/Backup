# !/bin/bash
HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"


# polybar -- config.ini only
POLYBAR_CONFIG_DIR="$HOME_CONFIG/polybar"
mkdir -p "$POLYBAR_CONFIG_DIR"

ln -srf ./polybar/miko.ini "$POLYBAR_CONFIG_DIR/config.ini"


# latte-dock -- copy .layout.latte only, DON'T symlink it
LATTE_CONFIG_DIR="$HOME_CONFIG/latte"
mkdir -p "$LATTE_CONFIG_DIR"

echo "latte-dock will be killed to avoid breaking current layout config"
pkill latte-dock
echo "Please restart latte-dock and change layout if needed"

cp -f ./latte/K21.layout.latte "$LATTE_CONFIG_DIR/K21.layout.latte"
cp -f ./latte/K21NB.layout.latte "$LATTE_CONFIG_DIR/K21NB.layout.latte"


# rofi -- whole directory
ln -nsrf ./rofi/ "$HOME_CONFIG"
