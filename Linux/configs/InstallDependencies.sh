HOME_LOCAL_SHARE="$HOME/.local/share"

# font dependencies
FONT_DIR="$HOME_LOCAL_SHARE/fonts"
mkdir -p "$FONT_DIR"

echo "Copy fonts to destination..."
cp -rf ../../Fonts/JetBrains/ "$FONT_DIR"
cp -rf ../../Fonts/NerdFonts/ "$FONT_DIR"

echo "Update fonts..."
fc-cache -f


# Softwares

echo "Update apt..."
sudo apt-get update
apt list --upgradable

echo "Apt Upgrade [y/N]?"
read do_upgrade_apt
if [ "$do_upgrade_apt" = "y" ] || [ "$do_upgrade_apt" = "Y" ]; then
    sudo apt-get upgrade
fi


## rofi
if [ "`command -v rofi`" = ""  ]; then
    echo "Rofi not found, install now..."
    sudo apt-get install rofi
fi



