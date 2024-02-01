FROM ubuntu:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240129"="rFactor2 Server,CLI admin,x11vnc for admin,fail2ban,wallpepers"

ENV RUNTIME_USER_ACCOUNT="rf2user"
ENV RUNTIME_USER_HOME="/home/rf2user"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

RUN ./step_installing_packages.sh

RUN ./step_x11vnc_create_config_folder.sh

RUN ./step_installing_powershell.sh

# ========================================================================
# rf2User configuration

RUN ./step_create_rf2user.sh

COPY --chmod=555 ./wallpapers/*.png /home/rf2user/Pictures

# ========================================================================
# Fail2ban configuration

COPY --chmod=555 ./configs/x11vnc_filter.conf /etc/fail2ban/filter.d/x11vnc.conf

RUN ./step_fail2ban_configure.sh

# ========================================================================
# Steamcmd & server installation & admin script copy
RUN ./step_installing_steamcmd.sh

RUN ./step_installing_rf2server.sh

COPY --chmod=555 ./adminScripts/*.sh /server 

# ========================================================================
# Item download and copy

RUN ./step_workshopcontent_downloaditems.sh

RUN ./step_workshopcontent_copyitems.sh

# ========================================================================

USER $RUNTIME_USER_ACCOUNT

WORKDIR /server
