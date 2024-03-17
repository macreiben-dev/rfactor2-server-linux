FROM blank-rf2-server:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240318"="startup scripts"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

RUN ./step_create_mountedlogfolder.sh
