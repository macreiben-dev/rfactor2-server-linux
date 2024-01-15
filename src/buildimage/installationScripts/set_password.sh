#!/bin/bash

RF2USER_HOME="/home/rf2user"
VNC_PASSWORD_PATH="$RF2USER_HOME/.vnc/passwd"

# Ensure rf2user has a valid shell
# chsh -s /bin/bash rf2user

# # Add rf2user to the necessary groups
# usermod -aG passwd,shadow rf2user

# Set ownership
# chown -R rf2user:rf2user $RF2USER_HOME

# Set VNC password
# if [ -z "$VNC_PASSWORD" ]; then
#   echo "VNC_PASSWORD not set. Using default password."
#   su -c "x11vnc -storepasswd yourpassword $VNC_PASSWORD_PATH" -s /bin/bash rf2user
# else
#   echo "Setting VNC password from environment variable."
#   echo "$VNC_PASSWORD" | su -c "x11vnc -storepasswd $VNC_PASSWORD $VNC_PASSWORD_PATH" -s /bin/bash rf2user 
# fi

if [ -z "$VNC_PASSWORD" ]; then
  echo "VNC_PASSWORD not set. Using default password."
  x11vnc -storepasswd yourpassword $VNC_PASSWORD_PATH
else
  echo "Setting VNC password from environment variable."
  echo "$VNC_PASSWORD" | x11vnc -storepasswd $VNC_PASSWORD $VNC_PASSWORD_PATH
fi

# Set ownership
chown -R rf2user:rf2user $RF2USER_HOME
