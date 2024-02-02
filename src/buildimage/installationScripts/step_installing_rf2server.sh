#!/bin/bash

mkdir /server \
  && cd /server \
  && /steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir /server +login anonymous +app_update 400300 validate +quit \
  && chown -R $RUNTIME_USER_ACCOUNT:$RUNTIME_USER_ACCOUNT /server \