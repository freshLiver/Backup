#!/bin/bash
dropboxPID="$(ps aux | grep dropbox | grep home | awk '{print $2}')"

if [ "$dropboxPID" = "" ]; then
    echo "Restart Dropbox !!" | tee >(systemd-cat)
    $HOME/.dropbox-dist/dropboxd 2>&1 | systemd-cat &
    disown | tee >(systemd-cat)
else
    dropbox stop | tee >(systemd-cat)
    sleep 5
    dropbox start | tee >(systemd-cat)
fi

