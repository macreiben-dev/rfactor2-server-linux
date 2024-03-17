#!/bin/bash

VNC_PASSWORD_PATH=~/.vnc/passwd

mkdir -p ~/.vnc

echo "Given runtime user is: " & whoami
echo "Computed VNC password path: $VNC_PASSWORD_PATH"

LOCAL_PASSWORD="yourpassword"

if [ -n "$VNC_PASSWORD" ]; then
  LOCAL_PASSWORD=$VNC_PASSWORD
fi

echo "Used local password: $LOCAL_PASSWORD"

x11vnc -storepasswd $LOCAL_PASSWORD $VNC_PASSWORD_PATH
