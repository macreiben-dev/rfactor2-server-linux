#!/bin/bash

# Set the password from environment variable
sh /scripts/startup_x11vnc_setPassword.sh

rm -f /tmp/.X0-lock

mkdir -p ~/.cache/xdgr
mkdir -p ~/.cache/xdgr/dconf

export XDG_RUNTIME_DIR=$PATH:~/.cache/xdgr

cp /etc/X11/xinit/xinitrc ~/.xinitrc

# Start Xvfb on display :0 with screen 0, resolution 1024x768x24
Xvfb :0 -screen 0 1024x768x24 > /tmp/xvfb.log 2>&1 &
export DISPLAY=:0

# Debug: Check if Xvfb is running
ps aux | grep Xvfb
netstat -tuln | grep 6000
echo "DISPLAY is set to: $DISPLAY"

# Wait for Xvfb to start
sleep 15

# Debug: Check Xvfb logs
echo "Xvfb logs:"
cat /tmp/xvfb.log

# Start XFCE session
startxfce4 &

# Wait for XFCE to start
sleep 5

# Debug: Check if ~/.Xauthority exists
ls -la ~/.Xauthority || xauth generate :0 . trusted

# Start x11vnc
x11vnc -v -forever -usepw -display :0 -auth ~/.Xauthority