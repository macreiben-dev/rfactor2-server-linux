#!/bin/bash

# Set the password from environment variable
sh /scripts/startup_x11vnc_setPassword.sh

# Start x server
x11vnc -forever -usepw -create -o /mnt/host-monitored/x11vnc.log && cd /server
