#!/bin/bash

RF2USER_HOME=$RUNTIME_USER_HOME

VNC_PASSWORD_PATH="$RF2USER_HOME/.vnc/passwd"

VNC_LOG_FOLDER="/var/log/x11vnc"
VNC_LOG_FILE="$VNC_LOG_FOLDER/x11vnc.log"

mkdir $RF2USER_HOME/.vnc
mkdir -p $VNC_LOG_FOLDER

echo "Given runtime user is: " & whoami
echo "Given runtime user home: $RF2USER_HOME"
echo "Computed VNC password path: $VNC_PASSWORD_PATH"
echo "Computed VNC log file: $VNC_LOG_FILE"

LOCAL_PASSWORD="yourpassword"

if [ -n "$VNC_PASSWORD" ]; then
  LOCAL_PASSWORD=$VNC_PASSWORD
fi

echo "Used local password: $LOCAL_PASSWORD"
 x11vnc -storepasswd $LOCAL_PASSWORD $VNC_PASSWORD_PATH -o $VNC_LOG_FILE
