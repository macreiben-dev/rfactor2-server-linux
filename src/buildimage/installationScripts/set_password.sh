#!/bin/bash

RF2USER_HOME="/home/rf2user"
VNC_PASSWORD_PATH="$RF2USER_HOME/.vnc/passwd"

if [ -z "$VNC_PASSWORD" ]; then
  echo "VNC_PASSWORD not set. Using default password."
  su -c "x11vnc -storepasswd yourpassword $VNC_PASSWORD_PATH" -s /bin/bash rf2user
else
  echo "Setting VNC password from environment variable."
  echo "$VNC_PASSWORD" | su -c "x11vnc -storepasswd $VNC_PASSWORD $VNC_PASSWORD_PATH" -s /bin/bash rf2user 
fi

chown -R rf2user:rf2user $RF2USER_HOME
