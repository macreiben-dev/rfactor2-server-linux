###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Download the PowerShell package file
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/powershell_7.4.0-1.deb_amd64.deb

###################################
# Install the PowerShell package
dpkg -i powershell_7.4.0-1.deb_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
apt-get install -f

# Delete the downloaded package file
rm powershell_7.4.0-1.deb_amd64.deb
