#!/bin/bash

# to use PA, make sure the following packages are installed
# pulseaudio
# pulseaudio-utils
# pulseaudio-module-bluetooth

systemctl --user stop pipewire.socket
systemctl --user stop pipewire
systemctl --user stop pipewire-pulse.socket
systemctl --user stop pipewire-pulse
systemctl --user disable pipewire
systemctl --user disable pipewire-pulse

systemctl --user enable pulseaudio
systemctl --user start pulseaudio
systemctl --user daemon-reload
