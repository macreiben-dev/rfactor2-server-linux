FROM ubuntu:latest

# Installation des paquets nécessaires
RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y wine \
  && apt-get install -y x11vnc xvfb openssh-server \
  && apt-get install -y lib32gcc-s1 lib32z1 lib32stdc++6 \
  && apt-get install -y curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Installation de SteamCMD
RUN mkdir /steamcmd \
  && cd /steamcmd \
  && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - \
  && ./steamcmd.sh +quit

# Installation de rFactor2
# RUN mkdir ~/.wine \
#   mkdir ~/.wine/drive_c \
#   && mkdir ~/.wine/drive_c/server \
#   && cd ~/.wine/drive_c/server \
#   && wine /steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/.wine/drive_c/server +app_update 365960 validate +quit

# Configuration du serveur SSH
# RUN mkdir /var/run/sshd \
#   && sed -ri 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config \
#   && sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Configuration du serveur VNC
RUN mkdir ~/.vnc \
  && echo "password" > ~/.vnc/passwd \
  && chmod 600 ~/.vnc/passwd

# Installation de la clé SSH
# RUN mkdir /root/.ssh \
#   && chmod 700 /root/.ssh \
#   && touch /root/.ssh/authorized_keys \
#   && chmod 600 /root/.ssh/authorized_keys \
#   && echo "Votre clé publique SSH" >> /root/.ssh/authorized_keys

# Exposition des ports
# On expose le port 22 pour le serveur SSH, le port 5900 pour le serveur VNC, le port 64297 pour le serveur web rFactor2 et le port 54297 pour le serveur de jeux rFactor2
EXPOSE 22
EXPOSE 5900
EXPOSE 64297
EXPOSE 54297/udp

# Démarrage du serveur SSH, du serveur VNC et de rFactor 2
#CMD ["bash", "-c", "service ssh start && x11vnc -forever -usepw -create && cd /server && wine64 rFactor2.exe +path=./ +fullproc +dedicated +serverName=\"My Server Name\" +raceFuel=100 +numThreads=2 +threads=2 +raceLaps=0 +startClear=\"100%\" +maxPlayers=16 +requiredPlayers=4 +httpPort=64297 +serverPort=54297"] 
CMD ["bash", "-c", "service ssh start && x11vnc -forever -usepw -create && cd /server"] 