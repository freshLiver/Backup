# !/bin/bash
HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"


# tmux -- .tmux.conf only
ln -srf ./.tmux.conf "$HOME/.tmux.conf"

# zsh -- .zshrc and .oh-my-zsh/themes/theme.zsh-theme
ZSH_TEHEM_DIR="$HOME/.oh-my-zsh/themes"
mkdir -p "$ZSH_TEHEM_DIR"

ln -srf ./zsh/.zshrc "$HOME/.zshrc"
ln -srf ./zsh/mytheme.zsh-theme "$ZSH_TEHEM_DIR"

# yakuake -- .config/yakuakerc
ln -srf ./yakuake/yakuakerc "$HOME_CONFIG"

# konsole -- .profile and colorscheme
KONSOLE_CONFIG_DIR="$HOME_LOCAL_SHARE/konsole"
mkdir -p "$KONSOLE_CONFIG_DIR"

ln -srf ./konsole/Breeze.colorscheme "$KONSOLE_CONFIG_DIR"
ln -srf ./konsole/Linux.colorscheme "$KONSOLE_CONFIG_DIR"
ln -srf ./konsole/KonsoleConfig.profile "$KONSOLE_CONFIG_DIR"