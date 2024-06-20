#!/bin/bash
# Run this script as root

[[ $(whoami) != "root" ]] && echo "You're not root." && exit 1

echo "192.168.56.11   devsecops" >> /etc/hosts

# Installing pre-requisite software
apt update
apt install -y docker.io docker-buildx docker-compose git ripgrep pip python3

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
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" > /etc/apt/sources.list.d/nodesource.list
apt update
apt install -y nodejs      # Fetching NodeJS 16 from NodeSource

echo "NODE INSTALLED: $(node --version)"
if [[ $(node --version | cut -d. -f1) != "v16" ]]
then echo "FAILURE: wrong Node version."; exit 1; fi

# Installing Angular
npm install --location=global @angular/cli@16.2.14

# Installing Chromium, for headless testing.
apt install -y chromium-browser 
echo "export CHROME_BIN=\"/snap/bin/chromium\"" >> /etc/bash.bashrc
echo "export CHROME_BIN=\"/snap/bin/chromium\"" >> /etc/profile

# Setting up and starting Docker.
# This assumes that you did a "su" or "sudo -i" to become root.
usermod -a -G docker $(who -s am i | cut -d" " -f1)
systemctl enable docker
systemctl start docker
docker pull hello-world

if [[ $? -ne 0 ]];
then echo "FAILURE: Docker pullfailed."; exit 1; fi

# Pulling images needed for Selenium labs
docker pull selenium/node-chrome:113.0
docker pull selenium/node-firefox:112.0
docker pull selenium/hub:4.9
docker pull bkimminich/juice-shop:v15.0.0

# Pulling image for SCA with OSV Scanner
docker pull ghcr.io/google/osv-scanner:latest

# Pulling Nessus image for day 5
docker pull tenable/nessus
mkdir ${HOME}/Nessus
curl --request GET --url "https://raw.githubusercontent.com/unixerius/DSO/main/Nessus/nessus-docker-compose.yml" --output "${HOME}/Nessus/docker-compose.yml" 

# Pulling zap2docker and Nuclei, which are big too
docker pull ghcr.io/zaproxy/zaproxy:latest
docker pull projectdiscovery/nuclei
 
