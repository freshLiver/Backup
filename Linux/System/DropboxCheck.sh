dropboxPID="$(ps aux | grep dropbox | grep home | awk '{print $2}')"

if [ "$dropboxPID" = "" ]; then
    echo "Restart Dropbox !!"
else
    echo ""
fi

