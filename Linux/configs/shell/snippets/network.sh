#!/bin/bash

function set-proxy() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 HOST:PORT"
    elif [[ -z "$1" ]]; then
        unset http_proxy https_proxy
    else
        export http_proxy="http://$1"
        export https_proxy="https://$1"
    fi
}


function host-local-site() {
    if [[ $# -ne 3 ]]; then
        echo "Usage: $0 PATH PORT CONTAINER_NAME"
    else
        docker run --restart=always --name=$3 -v "$(realpath $1)":/usr/share/nginx/html:ro -dp $2:80 -it nginx
    fi
}
