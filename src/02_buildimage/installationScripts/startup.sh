#!/bin/bash

# Set the password from environment variable
sh /scripts/startup_x11vnc_setPassword.sh

mkdir -p ~/.cache/xdgr

export XDG_RUNTIME_DIR=$PATH:~/.cache/xdgr

cp /etc/X11/xinit/xinitrc ~/.xinitrc

# Start Xvfb on display :0 with screen 0, resolution 1024x768x24
Xvfb :0 -screen 0 1024x768x24 &

# Wait for Xvfb to start
sleep 5

x11vnc -v -forever -usepw -display :0 -auth /root/.Xauthority