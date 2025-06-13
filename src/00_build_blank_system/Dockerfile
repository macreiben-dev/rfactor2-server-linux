FROM ubuntu:22.04

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240318"="packages only,powershell"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

RUN ./step_installing_packages.sh

RUN ./step_installing_powershell.sh

# ========================================================================

WORKDIR /server
