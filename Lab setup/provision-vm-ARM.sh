#!/bin/bash
# Run this script as root

[[ $(whoami) != "root" ]] && echo "You're not root." && exit 1

echo "192.168.56.11   devsecops" >> /etc/hosts

# Installing pre-requisite software
apt update
apt install -y docker.io docker-compose git ripgrep pip python3

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

echo 'export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-arm64/"' > /etc/profile.d/maven.sh
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

# Installing alternative and faster NodeJS package manager
npm install -g pnpm

# Installing Angular
npm install --location=global @angular/cli@latest

# Installing Chromium, for headless testing.
apt install -y chromium-browser 
echo "export CHROME_BIN=\"/snap/bin/chromium\"" >> /etc/bash.bashrc
echo "export CHROME_BIN=\"/snap/bin/chromium\"" >> /etc/profile

# Setting up and starting Docker.
usermod -a -G docker vagrant
systemctl enable docker
systemctl start docker
docker pull hello-world

if [[ $? -ne 0 ]];
then echo "FAILURE: Docker pullfailed."; exit 1; fi

# Pulling images needed for Selenium labs
docker pull seleniarm/node-chromium
docker pull seleniarm/node-firefox
docker pull seleniarm/hub
docker pull bkimminich/juice-shop

# Pulling image for SCA with OSV Scanner
docker pull ghcr.io/google/osv-scanner:latest

# Building Nessus container for ARM
curl --request GET --url 'https://raw.githubusercontent.com/unixerius/DSO/main/Nessus/nessus-docker-arm' --output '/tmp/nessus-docker-arm'
docker buildx build -t nessus -f /tmp/nessus-docker-arm /tmp

# Pulling zap2docker and Nuclei, which are big too
docker pull owasp/zap2docker-stable
docker pull projectdiscovery/nuclei
