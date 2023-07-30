#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo apt update
sudo apt install openjdk-11-jre

sudo usermod -aG sudo ubuntu

sudo usermod -aG docker ubuntu

