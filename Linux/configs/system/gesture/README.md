# [libinput-gesture](https://github.com/bulletmark/libinput-gestures)

## Requirements

- wmctrl
- xdotool
- libinput-tools

## Install

```shell
$ git clone https://github.com/bulletmark/libinput-gestures.git
$ cd libinput-gestures
$ sudo make install # (or sudo ./libinput-gestures-setup install)
```

## Usage

### 1. create config file at `~/.config/libinput-gestures.conf`

### 2. add $USER to "input" group

```shell
$ usermod -a -G input $USER
```

### 3. enable gesture `libinput-gestures-setup autostart start`

### 4. re-login
