#!/bin/bash

              # Update the package index
              apt-get update -y

              # Install necessary packages for Docker
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common

              # Add Docker's official GPG key
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

              # Set up the Docker stable repository
              echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

              # Update the package index again
              apt-get update -y

              # Install Docker Engine
              apt-get install -y docker-ce docker-ce-cli containerd.io

              # Start Docker service
              systemctl start docker
              systemctl enable docker