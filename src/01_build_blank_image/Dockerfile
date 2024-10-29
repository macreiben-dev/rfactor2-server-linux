FROM blank-rf2-server-system

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240318"="r2la,steamcmd"

ENV R2LA_VERSION_NAME="rF2 Log Analyzer ver. 2.1.026-x64"
ENV R2LA_ARCHIVE_NAME="$R2LA_VERSION_NAME.zip"

# ========================================================================
# Setup server packages and tool to install rf2Server.

RUN mkdir -p /scripts

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

# ========================================================================
# Copy r2la - log analyzer

COPY ./r2la/$R2LA_ARCHIVE_NAME /root/r2la.zip

RUN ./step_createxauthority.sh

RUN ./step_installing_r2la.sh

# ========================================================================

RUN ./step_installing_steamcmd.sh

