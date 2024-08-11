#!/bin/bash
APP_LOCAL_BASE_PATH=$HOME/.local/share

# put icons at $HOME/.local/share/.icons
mkdir -p "$APP_LOCAL_BASE_PATH/icons"
ln -srf ./icons/* "$APP_LOCAL_BASE_PATH/icons"

# put app entries at $HOME/.local/share/applications
mkdir -p "$APP_LOCAL_BASE_PATH/applications"
ln -srf ./entries/* "$APP_LOCAL_BASE_PATH/applications"


xdg-mime install --mode user ./mime/drawio-drawio.xml
xdg-icon-resource install --context mimetypes --size 128 ./icons/drawio.png text-x-drawio
update-mime-database ~/.local/share/mime/
