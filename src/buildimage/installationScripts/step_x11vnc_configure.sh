#!/bin/bash

cp /etc/X11/Xwrapper.config /etc/X11/Xwrapper.config.bak
sed -i 's/^allowed_users=console$/allowed_users=anybody/' /etc/X11/Xwrapper.config