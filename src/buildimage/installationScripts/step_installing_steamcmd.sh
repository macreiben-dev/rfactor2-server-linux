#!/bin/bash

mkdir /steamcmd \
  && cd /steamcmd \
  && wget "https://media.steampowered.com/client/steamcmd_linux.tar.gz" \
  && tar -xvzf steamcmd_linux.tar.gz \
  && ./steamcmd.sh +quit
