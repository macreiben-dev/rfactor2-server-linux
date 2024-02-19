FROM blank-rf2-server:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240219"="startup scripts"

# ENV RUNTIME_USER_ACCOUNT="rf2user"
# ENV RUNTIME_USER_HOME="/home/rf2user"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /server
