FROM empty-rf2-server:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240129"="rFactor2 Server,CLI admin,x11vnc for admin,wallpapers"

ENV RUNTIME_USER_ACCOUNT="rf2user"
ENV RUNTIME_USER_HOME="/home/rf2user"

COPY --chmod=555 ./rf2ServerInstallationScripts/* /scripts

WORKDIR /scripts

# ========================================================================
# rf2User configuration

RUN ./step_create_rf2user.sh

COPY --chmod=555 ./wallpapers/*.png /home/rf2user/Pictures

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

RUN chown -R $RUNTIME_USER_ACCOUNT:$RUNTIME_USER_ACCOUNT /server

USER $RUNTIME_USER_ACCOUNT

WORKDIR /server
