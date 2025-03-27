#!/bin/bash

# dropbox service
mkdir -p ~/.config/systemd/user
ln -srf ./cloud/dropbox.service ~/.config/systemd/user

systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable dropbox.service
systemctl --user start dropbox.service
