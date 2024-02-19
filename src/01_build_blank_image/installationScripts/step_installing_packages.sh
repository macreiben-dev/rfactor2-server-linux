#!/bin/bash

dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y wine \
  && apt-get install -y x11vnc xvfb \
  && apt-get install -y lib32gcc-s1 lib32z1 lib32stdc++6 \
  && apt-get install -y curl \
  && apt-get install -y wget \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 \
  && apt-get install -y vim \
  && apt-get install -y htop \
  && apt-get install -y unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
