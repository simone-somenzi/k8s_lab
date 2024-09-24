# Kubectl commands 

[Official quick reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)

### Minikube
~~~bash
minikube status
minikube start
minikube ip
minikube ssh
eval $(minikube docker-env)
~~~

## Context and configuration 
~~~bash
kubectl config view
kubectl config get-contexts 
kubectl config current-context  
kubectl config set-context --current --namespace=kube-system
~~~

## Resources view and list
~~~bash
kubectl get ns
kubectl get pods  
kubectl get pods -A 
kubectl get node -o wide      
kubectl describe po
kubectl get pod --sort-by=.metadata.name
kubectl get node -n kube-system
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'
kubectl get pods -A -o jsonpath='{.items[*].spec.containers[*].name}'
kubectl get pod -A  -o custom-columns=NAME:.metadata.name,PVC:spec.volumes[*].persistentVolumeClaim.claimName,NODE:spec.nodeName
kubectl get events
~~~

## Namespace
~~~bash
kubectl create namespace lab 
kubectl get ns lab -o yaml
kubectl create ns test-declarative -o yaml --dry-run=client
kubectl create ns test-declarative -o yaml --dry-run=client > /tmp/test-declarative.yaml
kubectl apply -f /tmp/test-declarative.yaml
kubectl get ns --sort-by=.metadata.creationTimestamp
kubectl config set-context --current --namespace=lab
~~~

## Label and selector
~~~bash
kubectl get po --show-labels
kubectl get pods --selector=component=kube-apiserver,tier=control-plane
kubectl get pods -l component=kube-apiserver,tier=control-plane
kubectl label ns test-declarative new-label=devforce
kubectl label ns test-declarative new-label- 
kubectl delete ns test-declarative   
~~~

## Pod
~~~bash
kubectl run nginx --image=nginx --port 80 --labels=name=value
kubectl delete pod nginx
kubectl run nginx --image=nginx  --port 80 --labels=name=value --dry-run=client -o yaml > /tmp/nginx-pod.yaml
kubectl logs nginx
kubectl exec nginx -- ls
kubectl exec -it nginx -- bash
kubectl debug nginx -it --image=busybox:1.28
kubectl debug nginx -it --image=busybox
kubectl port-forward nginx 8080:80
ls /etc > /tmp/file-temp; kubectl cp /tmp/file-temp nginx:/tmp/
kubectl exec nginx -- ls /tmp/file-temp -l
kubectl exec nginx -- cat /tmp/file-temp
~~~

## K9s

[k9s commands](https://k9scli.io/topics/commands/)

