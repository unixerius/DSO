#!/bin/bash
# Run this script as root

[[ $(whoami) != "root" ]] && echo "You're not root." && exit 1

echo "192.168.56.11   devsecops" >> /etc/hosts

# Setting up graphical environment
apt update
apt install -y ubuntu-desktop
systemctl set-default graphical.target
systemctl isolate multi-user.target

# Installing pre-requisite software
apt update
apt install -y docker.io docker-compose git ripgrep pip python3

# Setting up Java and Maven, for Selenium
apt install -y openjdk-17-jdk
cd ~
wget https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
cd /opt
tar zxvf ~/apache-maven-3.8.8-bin.tar.gz
ln -s apache-maven-3.8.8 /opt/maven
cd ~; rm apache-maven*.tar.gz

echo 'export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64/"' > /etc/profile.d/maven.sh
echo 'export M2_HOME="/opt/maven"' >> /etc/profile.d/maven.sh
echo 'export MAVEN_HOME="/opt/maven"' >> /etc/profile.d/maven.sh
echo 'export PATH="${M2_HOME}/bin:${PATH}"' >> /etc/profile.d/maven.sh

chmod +x /etc/profile.d/maven.sh

# Installing NodeJS from outside sources.
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt update
apt install -y nodejs      # Fetching NodeJS 16 from NodeSource

echo "NODE INSTALLED: $(node --version)"

# Installing alternative and faster NodeJS package manager
npm install -g pnpm

# Installing Angular
npm install --location=global @angular/cli@latest

# Installing Chromium, for headless testing.
apt install -y chromium-browser 
echo "export CHROME_BIN=\"/snap/bin/chromium\"" >> /etc/bash.bashrc
echo "export CHROME_BIN=\"/snap/bin/chromium\"" >> /etc/profile

# Installing Azure CLI
apt install -y ca-certificates curl apt-transport-https lsb-release gnupg

curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

export AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    tee /etc/apt/sources.list.d/azure-cli.list

apt update
apt install -y azure-cli

# Setting up and starting Docker.
# This assumes that you did a "su" or "sudo -i" to become root.
usermod -a -G docker $(who -s am i | cut -d" " -f1)
systemctl enable docker
systemctl start docker
docker pull hello-world

# Pulling images needed for Selenium labs
docker pull selenium/node-chrome
docker pull selenium/node-edge
docker pull selenium/node-firefox
docker pull selenium/hub
docker pull bkimminich/juice-shop

# Pulling image for SCA with OSV Scanner
docker pull ghcr.io/google/osv-scanner:latest

# Pulling Nessus image for day 5
docker pull tenableofficial/nessus
 
# Pulling the Unixerius DSO Git Repo
cd ~ 
git clone https://github.com/unixerius/DSO.git ./Unixerius-DSO

# Switching to graphical mode
systemctl isolate graphical.target

