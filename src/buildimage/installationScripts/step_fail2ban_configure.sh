
echo -e "\n[x11vnc]" \
    "\nenabled  = true" \
    "\nport     = 5900" \
    "\nfilter   = x11vnc" \
    "\nlogpath  = /var/log/x11vnc.log" \
    "\nmaxretry = 3" \
    "\nbantime  = 3600" | sudo tee -a /etc/fail2ban/jail.local
