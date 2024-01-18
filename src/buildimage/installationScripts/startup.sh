#!/bin/bash

# Set the password from environment variable
sh /scripts/set_password.sh

# Start x server
x11vnc -forever -usepw -create && cd /server