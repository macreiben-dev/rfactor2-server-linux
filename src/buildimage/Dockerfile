FROM ubuntu:latest

# ARG sshPublicKey
ARG workshopitemList
# Installation des paquets nécessaires
RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y wine \
  && apt-get install -y x11vnc xvfb \
  && apt-get install -y lib32gcc-s1 lib32z1 lib32stdc++6 \
  && apt-get install -y curl \
  && apt-get install -y wget \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 \
  && apt-get install -y vim \
  && apt-get install -y htop \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

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

COPY --chmod=555 ./adminScripts/*.sh /server 

# ================ Powershell install ====================

RUN mkdir -p /scripts

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
RUN mkdir -p /home/rf2user/.vnc

# ========================= VNC  ========================= ___EOF___

# ======================== STARTUP  ======================
COPY ./installationScripts/startup.sh /scripts/startup.sh
RUN chmod +x /scripts/startup.sh

# ======================== STARTUP  ======================= ___EOF___

COPY --chmod=555 ./installationScripts/download-item-workshop.ps1 /scripts/download-item-workshop.ps1
RUN pwsh /scripts/download-item-workshop.ps1 -WorkshopItems $workshopitemList -SteamCMDFolder /steamcmd

COPY --chmod=555 ./installationScripts/copy-dlc-to-packages.ps1 /scripts/copy-dlc-to-packages.ps1
RUN pwsh /scripts/copy-dlc-to-packages.ps1 -ServerInstallationDirectory /server -SteamCMDFolder /root/Steam

# ====================== USER CREATION  ======================

RUN useradd -ms /bin/bash rf2user -p $(perl -e 'print crypt($ARGV[0], "password")' 'rf2user')
RUN chown -R rf2user:rf2user /server
RUN chown -R rf2user:rf2user /home/rf2user


# ====================== USER CREATION  ====================== ___EOF__

RUN cp /etc/X11/Xwrapper.config /etc/X11/Xwrapper.config.bak
RUN sed -i 's/^allowed_users=console$/allowed_users=anybody/' /etc/X11/Xwrapper.config

USER rf2user

WORKDIR /server

