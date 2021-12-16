MPV_CONF="$HOME/.config/mpv"
mkdir -p $MPV_CONF

ln -sf "$PWD/input.conf"  "$MPV_CONF/input.conf"
ln -sf "$PWD/mpv.conf"  "$MPV_CONF/mpv.conf"
