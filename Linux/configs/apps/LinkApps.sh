#!/bin/bash
APP_LOCAL_BASE_PATH=$HOME/.local/share

# put icons at $HOME/.local/share/.icons
mkdir -p "$APP_LOCAL_BASE_PATH/icons"
ln -srf ./icons/* "$APP_LOCAL_BASE_PATH/icons"

# put app entries at $HOME/.local/share/applications
mkdir -p "$APP_LOCAL_BASE_PATH/applications"
ln -srf ./entries/* "$APP_LOCAL_BASE_PATH/applications"
