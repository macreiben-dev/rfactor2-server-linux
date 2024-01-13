#!/bin/bash

if [ -z "$VNC_PASSWORD" ]; then
  echo "VNC_PASSWORD not set. Using default password."
  x11vnc -storepasswd "yourpassword" ~/.vnc/passwd
else
  echo "Setting VNC password from environment variable."
  echo "$VNC_PASSWORD" | x11vnc -storepasswd $VNC_PASSWORD ~/.vnc/passwd
fi
