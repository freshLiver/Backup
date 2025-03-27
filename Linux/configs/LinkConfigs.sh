#!/bin/bash

# system configs
bash -c "cd ./system/ && ./LinkSystemConfigs.sh"
echo "all system configs linked!"

# shell/terminal configs
bash -c "cd ./shell/ && ./LinkShellConfigs.sh"
echo "all shell configs linked!"

# coding configs
bash -c "cd ./coding/ && ./LinkCodingConfigs.sh"
echo "all coding configs linked!"

# systemd-service configs
bash -c "cd ./services/ && ./install-services.sh"
echo "all systemd-services installed!"

# multimedia configs
bash -c "cd ./media/ && ./LinkMediaConfigs.sh"
echo "all multi-media configs linked!"

# desktop entries
bash -c "cd ./apps/ && ./LinkApps.sh"
echo "all app entries/icons linked!"

# utils
bash -c "cd ./utils/ && ./LinkUtilsConfigs.sh"
echo "all util configs linked!"
