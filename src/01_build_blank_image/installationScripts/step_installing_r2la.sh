#!/bin/bash

unzip /root/r2la.zip -d /root/tmp

mkdir -p /r2la

SOURCE_PATH="/root/tmp/$R2LA_VERSION_NAME"

mv "$SOURCE_PATH"/* /r2la
