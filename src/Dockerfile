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
RUN mkdir -p ~/.vnc && x11vnc -storepasswd $vncPassword ~/.vnc/passwd

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

COPY ./ServerUnlock.bin[t] /server/UserData
COPY --chmod=555 ./adminScripts/*.sh /server 

# Copy powershell installation scripts
RUN mkdir -p /scripts
COPY ./install_ps.sh /scripts/install_ps.sh

WORKDIR /scripts
RUN chmod +x install_ps.sh
RUN ./install_ps.sh

COPY --chmod=555 ./installationScripts/download-item-workshop.ps1 /scripts/download-item-workshop.ps1
RUN pwsh /scripts/download-item-workshop.ps1 -WorkshopItems $workshopitemList -SteamCMDFolder /steamcmd

COPY --chmod=555 ./installationScripts/copy-dlc-to-packages.ps1 /scripts/copy-dlc-to-packages.ps1
RUN pwsh /scripts/copy-dlc-to-packages.ps1 -ServerInstallationDirectory /server -SteamCMDFolder /root/Steam

WORKDIR /server

# Exposition des ports
# On expose le port 22 pour le serveur SSH, le port 5900 pour le serveur VNC, le port 64297 pour le serveur web rFactor2 et le port 54297 pour le serveur de jeux rFactor2
EXPOSE 5900
EXPOSE 64297
EXPOSE 54297/udp

# Démarrage du serveur SSH, du serveur VNC et de rFactor 2
#CMD ["bash", "-c", "service ssh start && x11vnc -forever -usepw -create && cd /server && wine64 rFactor2.exe +path=./ +fullproc +dedicated +serverName=\"My Server Name\" +raceFuel=100 +numThreads=2 +threads=2 +raceLaps=0 +startClear=\"100%\" +maxPlayers=16 +requiredPlayers=4 +httpPort=64297 +serverPort=54297"] 
CMD ["bash", "-c", "x11vnc -forever -usepw -create && cd /server"]                                          