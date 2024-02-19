#!/bin/bash

# Set the password from environment variable
sh /scripts/startup_x11vnc_setPassword.sh

# Start x server
x11vnc -forever -usepw -create -o ~/.vnc/x11vnc.log && cd /server

# Symbolic link to x11vnc.log
ln -s  ~/.vnc/x11vnc.log /mnt/host-monitored/x11vnc.log
