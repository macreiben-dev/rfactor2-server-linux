FROM empty-rf2-server:latest

ARG workshopitemList

LABEL "author"="macreibendev - Christian Finel"

LABEL "game"="rFactor2"

LABEL "features.release_20240213"="rFactor2 Server,CLI admin,wallpapers"

ENV RUNTIME_USER_ACCOUNT="rf2user"
ENV RUNTIME_USER_HOME="/home/rf2user"

COPY --chmod=555 ./installationScripts/* /scripts

WORKDIR /scripts

# ========================================================================
# rf2User configuration

RUN ./step_create_rf2user.sh

COPY --chmod=555 ./wallpapers/*.png /home/rf2user/Pictures

RUN mkdir -p /home/rf2user/Desktop

COPY --chmod=555 ./desktopShortcuts/* /home/rf2user/Desktop

# ========================================================================
# Steamcmd & server installation & admin script copy
RUN ./step_installing_rf2server.sh

COPY --chmod=555 ./adminScripts/*.sh /server 

# ========================================================================
# Item download and copy

RUN ./step_workshopcontent_downloaditems.sh

RUN ./step_workshopcontent_copyitems.sh

# ========================================================================

RUN chown -R $RUNTIME_USER_ACCOUNT:$RUNTIME_USER_ACCOUNT /server

RUN chown -R $RUNTIME_USER_ACCOUNT:$RUNTIME_USER_ACCOUNT /r2la

RUN chown -R $RUNTIME_USER_ACCOUNT:$RUNTIME_USER_ACCOUNT /mnt/host-monitored

USER $RUNTIME_USER_ACCOUNT

WORKDIR /server
