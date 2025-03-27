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
ln -srf ./shell/konsole/Linux.colorscheme "$KONSOLE_CONFIG_DIR"
ln -srf ./shell/konsole/KonsoleConfig.profile "$KONSOLE_CONFIG_DIR"


# coding configs
bash -c "cd ./coding/ && ./LinkCodingConfigs.sh"


# batcat -- whole directory
ln -nsrf ./bat/ "$HOME_CONFIG"



# fcitx5 themes
bash -c "cd ./fcitx5/ && ./LinkConfig.sh"

# goldendict
ln -nsrf ./goldendict "$HOME_CONFIG"


# multimedia configs
bash -c "cd ./media/ && ./LinkMediaConfigs.sh"

# libinput-gesture
ln -srf ./gesture/libinput-gestures.conf "$HOME_CONFIG/libinput-gestures.conf"

echo "Restarting..."
libinput-gestures-setup restart
libinput-gestures-setup autostart start



# desktop entries
bash -c "cd ./apps/ && ./LinkApps.sh"
