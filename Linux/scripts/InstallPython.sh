#!/usr/bin/env bash

# ------------------------------------------------------------------------------------
# Colored Echo 

HighLight () {
    # $1 : string, msg
    echo -e "\e[1;41m$1\e[m"

    # $2 : bool, whether pause after msg
    if [ "$2" = "true" ]; then
        read
    fi
}

# ------------------------------------------------------------------------------------
# get args from cli params

PIP="false"
VENV="false"
VERSION=""
WORK_DIR="/tmp"
YES=""

while [ $# -gt 0 ]; do

    # what should this arg do
    case "$1" in

        # tmp dir
        -d | --directory )
            WORK_DIR="$2";
            shift;
            shift;
        ;;

        # specify target version
        -v | --version )
            VERSION="$2";

            # TODO check version

            shift;
            shift;
        ;;

        # bool, install pip ?
        --pip )
            PIP="true";
            shift;
        ;;

        # bool, install tkinter ?
        --tk )
            TK="true";
            shift;
        ;;

        # bool, install virtualenv ?
        --venv )
            VENV="true";
            shift;
        ;;

        # bool, apt install auto yes
        -y | --yes )
            YES="-y";
            shift;
        ;;

        # show help messages
        -h | --help )
            echo "HELP TODO";
            exit;
        ;;

        # others
        * )
            ehco "Unknown Argument > '$1'";
            exit;
        ;;

    esac
done

HighLight "Check Arguments : "
HighLight "Python Version $VERSION"


HighLight "venv : $"
HighLight "" true

# ------------------------------------------------------------------------------------
# Install Requirements

apt-get update

apt install $YES \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libbz2-dev \
    wget

# tkinter dependency
if [ "$TK" = "true" ]; then
    # show msg
    HighLight "Next : tkinter dependency. Press ENTER to continue." true

    apt install $YES \
        python3-tk \
        tk-dev
fi

# ------------------------------------------------------------------------------------
# Download and Compile Python main

cd "$WORK_DIR"
wget -c "https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tar.xz"
tar -xf "Python-$VERSION.tar.xz"


# ------------------------------------------------------------------------------------
# Compile

cd "Python-$VERSION"
./configure --enable-optimizations --enable-loadable-sqlite-extensions --enable-shared

make altinstall
ldconfig /usr/local/lib


# ------------------------------------------------------------------------------------
# Install pip

if [ "$PIP" = "true" ]; then

    # show msg
    HighLight "Next : pip${VERSION%\.*}. Press ENTER to continue." true

    # install pip
    "python${VERSION%\.*}" -m ensurepip --upgrade
fi

# ------------------------------------------------------------------------------------
# Install venv

if [ "$VENV" = "true" ]; then
    # show msg
    HighLight "Next : python3-venv. Press ENTER to continue." true

    # install venv
    apt install $YES python3-venv
fi
