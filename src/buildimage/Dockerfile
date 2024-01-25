FROM ubuntu:latest

ARG workshopitemList

# ========================================================================
# Copy installation script to script directory.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

RUN ./step_installing_packages.sh

RUN ./step_x11vnc_create_config_folder.sh

RUN ./step_installing_powershell.sh

RUN ./step_create_rf2user.sh

COPY --chmod=555 ./wallpapers/*.png /home/rf2user/Pictures

RUN ./step_x11vnc_configure.sh

# ========================================================================
# Steamcmd & server installation & admin script copy
RUN ./step_installing_steamcmd.sh

RUN ./step_installing_rf2server.sh

COPY --chmod=555 ./adminScripts/*.sh /server 

# ========================================================================

RUN ./step_workshopcontent_downloaditems.sh

RUN ./step_workshopcontent_copyitems.sh

USER rf2user

WORKDIR /server
