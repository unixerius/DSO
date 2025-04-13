#!/bin/bash
# Run this script as root
# Run this in a Debian 11 VM.

[[ $(whoami) != "root" ]] && echo "You're not root." && exit 1

echo "192.168.56.11   devsecops" >> /etc/hosts

export MYHOME="/home/vagrant"

# Installing pre-requisite software
apt update
apt install -y docker.io docker-compose git ripgrep pip python3 dos2unix

# Needed for the Cypres tests of JuiceShop
apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3 libxss1 libasound2 libxtst6 xauth xvfb

which docker >/dev/null 2>&1 
if [[ $? -ne 0 ]];
then echo "FAILURE: Docker install failed."; exit 1; fi

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

. /etc/profile.d/maven.sh
which mvn >/dev/null 2>&1
if [[ $? -ne 0 ]];
then echo "FAILURE: Maven install failed."; exit 1; fi

# Installing NodeJS from outside sources.
[[ ! -d /etc/apt/keyrings ]] && mkdir /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" > /etc/apt/sources.list.d/nodesource.list
apt update
apt install -y nodejs      # Fetching NodeJS 20 from NodeSource

echo "NODE INSTALLED: $(node --version)"
if [[ $(node --version | cut -d. -f1) != "v20" ]]
then echo "FAILURE: wrong Node version."; exit 1; fi

# Installing Angular
npm install --location=global @angular/cli

# Installing Chromium, for headless testing.
apt install -y chromium
echo "export CHROME_BIN=\"/usr/bin/chromium\"" >> /etc/bash.bashrc
echo "export CHROME_BIN=\"/usr/bin/chromium\"" >> /etc/profile

# Setting up and starting Docker.
usermod -a -G docker vagrant
systemctl enable docker
systemctl start docker
docker pull hello-world

if [[ $? -ne 0 ]];
then echo "FAILURE: Docker pull failed."; exit 1; fi

# Pulling images needed for Selenium labs
echo "Pulling Selenium container images (two nodes and hub)"
docker pull selenium/node-chrome:113.0
docker pull selenium/node-firefox:112.0
docker pull selenium/hub:4.9

echo "Pulling node20 container image for building."
docker pull node:20

echo "Pulling Juice Shop container image"
docker pull bkimminich/juice-shop:v15.0.0

# Pulling image for SCA with OSV Scanner
echo "Pulling OSV Scanner container image"
docker pull ghcr.io/google/osv-scanner:latest

# Pulling SAST scanner
echo "Pulling semgrep container image"
docker pull returntocorp/semgrep

# Pulling Nessus image for day 5
echo "Pulling Nessus Ubuntu container image"
docker pull tenable/nessus:latest-ubuntu
mkdir ${MYHOME}/Nessus
curl --request GET --url "https://raw.githubusercontent.com/unixerius/DSO/main/Nessus/nessus-docker-compose.yml" --output "${MYHOME}/Nessus/docker-compose.yml" 
dos2unix ${MYHOME}/Nessus/*

# Pulling zap2docker and Nuclei, which are big too
echo "Pulling Zaproxy container image"
docker pull ghcr.io/zaproxy/zaproxy:latest
echo "Pulling Nuclei container image"
docker pull projectdiscovery/nuclei

chown -R vagrant:vagrant ${MYHOME}
