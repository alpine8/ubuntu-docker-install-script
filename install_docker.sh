#!/usr/bin/bash

# Update existing list of packages
sudo apt-get update

# Install prerequisite packages
sudo apt-get install ca-certificates curl gnupg

# Install directory for apt keyring
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker’s GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set correct permissions for Docker GPG key
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker's stable repository to apt list
deb_arch=$(dpkg --print-architecture)
os_version=$(. /etc/os-release && echo "$VERSION_CODENAME")
echo \
  "deb [arch=${deb_arch} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  ${os_version} stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package list
sudo apt-get update

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test Docker installation
sudo docker run hello-world
