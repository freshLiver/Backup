dropboxPID="$(ps aux | grep dropbox | grep home | awk '{print $2}')"

if [ "$dropboxPID" = "" ]; then
    echo "Restart Dropbox !!"
    nohup $HOME/.dropbox-dist/dropboxd | systemd-cat &
else
    dropbox stop
    sleep 5
    dropbox start
fi

