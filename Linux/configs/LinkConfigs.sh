# !/bin/bash
HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"



# tmux -- .tmux.conf only
ln -srf ./shell/.tmux.conf "$HOME/.tmux.conf"

# zsh -- .zshrc and .oh-my-zsh/themes/theme.zsh-theme
ZSH_TEHEM_DIR="$HOME/.oh-my-zsh/themes"
mkdir -p "$ZSH_TEHEM_DIR"

ln -srf ./shell/zsh/.zshrc "$HOME/.zshrc"
ln -srf ./shell/zsh/mytheme.zsh-theme "$ZSH_TEHEM_DIR"

# yakuake -- .config/yakuakerc
ln -srf ./shell/yakuake/yakuakerc "$HOME_CONFIG"

# konsole -- .profile and colorscheme
KONSOLE_CONFIG_DIR="$HOME_LOCAL_SHARE/konsole"
mkdir -p "$KONSOLE_CONFIG_DIR"

ln -srf ./shell/konsole/Breeze.colorscheme "$KONSOLE_CONFIG_DIR"
ln -srf ./shell/konsole/KonsoleConfig.profile "$KONSOLE_CONFIG_DIR"


# vscode -- settings.json and keybind.json
VSCODE_CONFIG_DIR="$HOME_CONFIG/Code/User"
mkdir -p "$VSCODE_CONFIG_DIR"

ln -srf ./VSCode/settings.json "$VSCODE_CONFIG_DIR/settings.json"
ln -srf ./VSCode/keybindings.json "$VSCODE_CONFIG_DIR/keybindings.json"


# vim -- .vimrc and .vim/colors
VIM_THEME_DIR="$HOME/.vim/"
mkdir -p "$VIM_THEME_DIR"

ln -srf ./vim/.vimrc "$HOME/.vimrc"
ln -nsrf ./vim/colors/ "$VIM_THEME_DIR"


# batcat -- whole directory
ln -nsrf ./bat/ "$HOME_CONFIG"



# fcitx5 themes -- whole directory
FCITX5_THEME_DIR="$HOME_LOCAL_SHARE/fcitx5"
mkdir -p "$FCITX5_THEME_DIR"

ln -nsrf ./fcitx5/themes/ "$FCITX5_THEME_DIR"



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



# deadbeef
ln -nsrf ./deadbeef/ "$HOME_CONFIG"

# mpv -- whole directory
ln -nsrf ./mpv/ "$HOME_CONFIG"
