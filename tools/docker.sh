#!/usr/bin/env bash

# Docker Latest Install
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    -y -q=2

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -q=2
sudo apt-get install docker-ce docker-ce-cli containerd.io -y -q=2

sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Machine
# TODO: Check new version: https://github.com/docker/machine/releases
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
rm docker-machine

# Docker Compose
# TODO: Check new version: https://github.com/docker/compose/releases
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Kubernetes
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# minicube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
rm minikube

# ctop docker ps view
# TODO: Check new version: https://github.com/bcicen/ctop/releases
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

# Add dockerclean command
echo "alias dclean='docker system prune -f; docker volume prune -f; docker network prune -f'" >> ~/.profile >> ~/.bashrc
echo "alias dremove='docker rm \$(docker ps -aq) -f; docker rmi \$(docker images -q) -f; docker volume rm \$(docker volume ls -q) -f'" >> ~/.profile >> ~/.bashrc
echo "alias dlist='docker ps -a'" >> ~/.profile >> ~/.bashrc
echo "alias dstop='docker stop \$(docker ps -aq)'" >> ~/.profile >> ~/.bashrc

# Add dcup command
echo "alias dcomposereup='docker-compose up --build --force-recreate --remove-orphans'" >> ~/.profile >> ~/.bashrc
