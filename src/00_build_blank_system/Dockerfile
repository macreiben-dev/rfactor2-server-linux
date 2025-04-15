FROM ubuntu:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240318"="packages only,powershell"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY ./installationScripts/* /scripts

RUN chmod 555 /scripts/*

WORKDIR /scripts

RUN ./step_installing_packages.sh

RUN ./step_installing_powershell.sh

# ========================================================================

WORKDIR /server
