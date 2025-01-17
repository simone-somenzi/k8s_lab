#color section
BLUE=\033[1;34m
GREEN=\033[1;32m
RED=\033[1;31m
FLAT=\033[0m

all: docker-install kubectl-install kubectl-autocompletition-install helm-install minikube-install minikube-start k9s-install traefik-install nginx-crd-intall

docker-install:
		@echo "${BLUE}Installing Docker{FLAT}"
		sudo apt-get update
		sudo apt-get -y install ca-certificates curl
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
		sudo chmod a+r /etc/apt/keyrings/docker.asc
		echo \
			"deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
			$$(. /etc/os-release && echo "$$VERSION_CODENAME") stable" | \
			sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt-get update
		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
		sudo usermod -aG docker $$USER

kubectl-install:
		@echo "${BLUE}Installing kubectl${FLAT}"
		curl -LO "https://dl.k8s.io/release/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
		sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
		chmod +x kubectl
		mkdir -p ~/.local/bin
		mv ./kubectl ~/.local/bin/kubectl		

kubectl-autocompletition-install: 
		@echo "${BLUE}Installing kubectl autocompletition${FLAT}"
		kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
		sudo chmod a+r /etc/bash_completion.d/kubectl

		echo 'alias k=kubectl' >>~/.bashrc
		echo 'complete -o default -F __start_kubectl k' >>~/.bashrc

helm-install: 
		@echo "${BLUE}Installing Helm${FLAT}"
		curl --output helm-linux-amd64.tar.gz https://get.helm.sh/helm-v3.16.0-linux-amd64.tar.gz
		tar -zxvf helm-linux-amd64.tar.gz
		sudo mv linux-amd64/helm /usr/local/bin/helm
		rm helm-linux-amd64.tar.gz
		rm -rf linux-amd64

minikube-install: 
		@echo "${BLUE}Installing Minikube${FLAT}"
		cd ~
		curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
		sudo apt install ./minikube_latest_amd64.deb -y
		rm minikube_latest_amd64.deb

minikube-start: 
		@echo "${BLUE}Starting Minikube${FLAT}"
		minikube start

k9s-install:
		@echo "${BLUE}Installing K9S${FLAT}"
		cd ~
		curl -L https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_amd64.tar.gz -o k9s
		tar -xf k9s
		chmod +x k9s
		sudo  mv ./k9s /usr/local/bin/k9s

traefik-install:
		@echo "${BLUE}Installing Traefik${FLAT}"
		helm repo add traefik https://helm.traefik.io/traefik
		helm repo update
		helm install traefik traefik/traefik -n traefik --create-namespace 

nginx-crd-intall:
		@echo "${BLUE}Installing NGINX CRD${FLAT}"
		helm upgrade --install ingress-nginx ingress-nginx \   --repo https://kubernetes.github.io/ingress-nginx \   --namespace ingress-nginx --create-namespace

firexox-install: 
		@echo "${BLUE}Installing Firefox${FLAT}"
		sudo apt install firefox 
