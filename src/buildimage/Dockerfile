FROM ubuntu:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240213"="x11vnc for admin,packages"

ENV RUNTIME_USER_ACCOUNT="rf2user"
ENV RUNTIME_USER_HOME="/home/rf2user"
ENV R2LA_VERSION_NAME="rF2-Log-Analyzer-ver.2.1.022-x64"
ENV R2LA_ARCHIVE_NAME="$R2LA_VERSION_NAME.zip"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

RUN ./step_installing_packages.sh

RUN ./step_installing_powershell.sh

# ========================================================================
# Exposing mounted log files

RUN ./step_create_mountedlogfolder.sh

# ========================================================================
# Install r2la - log analyzer

COPY ./r2la/$R2LA_ARCHIVE_NAME /root/r2la.zip

RUN ./step_installing_r2la.sh

# # # # ========================================================================
# # # # Steamcmd & server installation & admin script copy
# # # RUN ./step_installing_steamcmd.sh

# # # RUN ./step_installing_rf2server.sh

# # # COPY --chmod=555 ./adminScripts/*.sh /server 

# # # # ========================================================================
# # # # Item download and copy

# # # RUN ./step_workshopcontent_downloaditems.sh

# # # RUN ./step_workshopcontent_copyitems.sh

# ========================================================================

USER $RUNTIME_USER_ACCOUNT

WORKDIR /server
