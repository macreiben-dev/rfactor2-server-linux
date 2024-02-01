#!/bin/bash

rm /etc/fail2ban/jail.d/*

touch /etc/fail2ban/jail.d/jail.local

echo -e "\n[x11vnc]" \
        "\nenabled  = true" \
        "\nport     = 5900" \
        "\nfilter   = x11vnc" \
        "\nlogpath  = $RUNTIME_USER_HOME/.vnc/x11vnc.log" \
        "\nmaxretry = 3" \
        "\nbantime  = 3600" | tee -a /etc/fail2ban/jail.d/jail.local

systemctl enable fail2ban