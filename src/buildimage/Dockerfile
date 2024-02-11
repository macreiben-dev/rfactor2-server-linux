FROM ubuntu:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240210"="x11vnc for admin,wallpapers"

ENV RUNTIME_USER_ACCOUNT="rf2user"
ENV RUNTIME_USER_HOME="/home/rf2user"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

RUN ./step_installing_packages.sh

RUN ./step_installing_powershell.sh

# ========================================================================
# x11 configuration

RUN ./step_x11vnc_configure.sh

# ========================================================================
# Exposing mounted log files

RUN ./step_create_mountedlogfolder.sh

WORKDIR /server
