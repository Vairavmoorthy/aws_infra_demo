#!/bin/bash
sudo apt update
sudo apt install openjdk-17-jre
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo apt-get install -y unzip
cd /opt
wget https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_amd64.zip
sudo unzip terraform.zip -d /usr/local/bin/
sudo chmod +x /usr/local/bin/terraform
