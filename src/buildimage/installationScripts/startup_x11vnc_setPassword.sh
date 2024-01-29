#!/bin/bash

RF2USER_HOME="/root"
VNC_PASSWORD_PATH="$RF2USER_HOME/.vnc/passwd"

if [ -z "$VNC_PASSWORD" ]; then
  echo "VNC_PASSWORD not set. Using default password."
  x11vnc -storepasswd yourpassword $VNC_PASSWORD_PATH
else
  echo "Setting VNC password - ${VNC_PASSWORD} - from environment variable."
  echo "$VNC_PASSWORD" | x11vnc -storepasswd $VNC_PASSWORD $VNC_PASSWORD_PATH
fi
