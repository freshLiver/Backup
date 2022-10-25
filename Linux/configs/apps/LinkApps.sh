#!/bin/bash
APP_LOCAL_BASE=$HOME/.local/share

# put icons at $HOME/.local/share/.icons
ln -srf ./icons/* "$APP_LOCAL_BASE/icons"

# put app entries at $HOME/.local/share/applications
ln -srf ./entries/* "$APP_LOCAL_BASE/applications"
