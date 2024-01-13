FROM ubuntu:latest

# ARG sshPublicKey
ARG workshopitemList
ARG vncPassword

# Installation des paquets nécessaires
RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y wine \
  && apt-get install -y x11vnc xvfb \
  && apt-get install -y lib32gcc-s1 lib32z1 lib32stdc++6 \
  && apt-get install -y curl \
  && apt-get install -y wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Configuration du serveur VNC
# RUN mkdir -p ~/.vnc && x11vnc -storepasswd $vncPassword ~/.vnc/passwd

# Installation de SteamCMD
RUN mkdir /steamcmd \
  && cd /steamcmd \
  && wget "https://media.steampowered.com/client/steamcmd_linux.tar.gz" \
  && tar -xvzf steamcmd_linux.tar.gz \
  && ./steamcmd.sh +quit

# Installation de rFactor2
RUN mkdir /server \
  && cd /server \
  && /steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir /server +login anonymous +app_update 400300 validate +quit

COPY ./ServerUnlock.bin /server/UserData
COPY --chmod=555 ./adminScripts/*.sh /server 

RUN mkdir -p /scripts

# ================ Powershell install ====================
# Copy powershell installation scripts
COPY ./install_ps.sh /scripts/install_ps.sh

WORKDIR /scripts
RUN chmod +x install_ps.sh
RUN ./install_ps.sh
# ================ Powershell install ==================== ___EOF___

# ========================= VNC  =========================
# Copy vnc password definition script
COPY ./installationScripts/set_password.sh /scripts/set_password.sh
RUN chmod +x /scripts/set_password.sh
RUN mkdir -p ~/.vnc

# ========================= VNC  ========================= ___EOF___

# ======================== STARTUP  ======================
COPY ./installationScripts/startup.sh /scripts/startup.sh
RUN chmod +x /scripts/startup.sh

# ======================== STARTUP  ======================= ___EOF___

COPY --chmod=555 ./installationScripts/download-item-workshop.ps1 /scripts/download-item-workshop.ps1
RUN pwsh /scripts/download-item-workshop.ps1 -WorkshopItems $workshopitemList -SteamCMDFolder /steamcmd

COPY --chmod=555 ./installationScripts/copy-dlc-to-packages.ps1 /scripts/copy-dlc-to-packages.ps1
RUN pwsh /scripts/copy-dlc-to-packages.ps1 -ServerInstallationDirectory /server -SteamCMDFolder /root/Steam

WORKDIR /server

# Exposing server ports
EXPOSE 5900
EXPOSE 64297
EXPOSE 64298
EXPOSE 64299
EXPOSE 54297
                                  