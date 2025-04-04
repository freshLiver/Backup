#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "Usage $0 COMPATDATA_ID APPDATA_LOCAL_PATH [PROTON_VERSION] [STEAMAPPS_PATH]"
    exit 1
fi

COMPATDATA_ID=$1
APPDATA_LOCAL_PATH=$2
PROTON_VERSION=${3:-"Proton - Experimental"}
STEAMAPPS_PATH=${4:-"$HOME/.steam/steam/steamapps"}

export STEAM_COMPAT_DATA_PATH="$STEAMAPPS_PATH/compatdata/$COMPATDATA_ID"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="/tmp/steamproton/"
APP_PATH="$STEAM_COMPAT_DATA_PATH/pfx/drive_c/users/steamuser/AppData/Local/$APPDATA_LOCAL_PATH"

"$STEAMAPPS_PATH/common/$PROTON_VERSION/proton" run "$APP_PATH"
