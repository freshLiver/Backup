# !/bin/bash
HOME_CONFIG="$HOME/.config"
HOME_LOCAL_SHARE="$HOME/.local/share"

mkdir -p "$HOME_CONFIG"
mkdir -p "$HOME_LOCAL_SHARE"


# system configs
bash -c "cd ./system/ && ./LinkSystemConfigs.sh"

# shell/terminal configs
bash -c "cd ./shell/ && ./LinkShellConfigs.sh"

# coding configs
bash -c "cd ./coding/ && ./LinkCodingConfigs.sh"


# goldendict
ln -nsrf ./goldendict "$HOME_CONFIG"

# multimedia configs
bash -c "cd ./media/ && ./LinkMediaConfigs.sh"

# desktop entries
bash -c "cd ./apps/ && ./LinkApps.sh"
