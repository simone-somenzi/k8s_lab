# Kubernetes examples
## Installing General packages using make file

### Prerequisite

Install make
~~~bash
sudo apt install make
~~~

### Installing Single package 

Installing docker
~~~bash
make docker-install 
~~~
press tab after make command to retrieve the list of install commands

### Installing all packages
~~~bash
make all 
~~~

## Installing General packages manually
### Installing Docker 
~~~bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
~~~

### Installing kubectl
~~~bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
~~~

### Configure kubectl autocompletition
~~~bash
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
sudo chmod a+r /etc/bash_completion.d/kubectl

echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
~~~

### Installing Helm
~~~bash
curl --output helm-linux-amd64.tar.gz https://get.helm.sh/helm-v3.16.0-linux-amd64.tar.gz
tar -zxvf helm-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm helm-linux-amd64.tar.gz
rm -rf linux-amd64
~~~

### Installing Minikube
~~~bash
cd ~
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo apt install ./minikube_latest_amd64.deb -y
rm minikube_latest_amd64.deb
~~~

### Installing k9s
~~~bash
cd ~
curl -L https://github.com/derailed/k9s/releases/download/v0.21.4/k9s_Linux_x86_64.tar.gz -o k9s
		curl -L https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_amd64.tar.gz -o k9s
tar -xf k9s
chmod +x k9s
sudo  mv ./k9s /usr/local/bin/k9s
k9s
~~~

## Working with Kubectl

[Kubectl commands](./kubectl-commands/kubectl-commands.md)

## Working with Workloads

[Workloads examples](./workloads/workloads.md)

## Working with k8s Persistence

[Persistence examples](./persistence/persistence.md)

## Working with Service and Ingress

[Services and Ingress](./service-ingress/service-ingress.md)

## Working with Helm

[Helm commands and chart example](./helm/helm.md)