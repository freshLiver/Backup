#!/bin/bash

# to use PW, make sure you have installed:
# pipewire
# pipewire-audio-client-libraries
# pipewire-media-session
# pipewire-pulse
# libspa-X.Y-modules
# libspa-X.Y-bluetooth

systemctl --user stop pulseaudio.socket
systemctl --user stop pulseaudio
systemctl --user disable pulseaudio
systemctl --user enable pipewire
systemctl --user enable pipewire-pulse
systemctl --user start pipewire
systemctl --user start pipewire-pulse
systemctl --user daemon-reload
