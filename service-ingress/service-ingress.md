# K8s Serices and Ingresses

## Nginx Ingress examples

~~~bash
kubectl apply -f azure-example-ingress.yaml
#add authentication
htpasswd -cb auth user P@ssw0rd
#kubectl create secret generic basic-auth --from-file=auth
kubectl apply -f azure-vote-auth-secret.yaml
~~~



## Traefik Ingress examples

~~~bash
kubectl apply -f nginx-ingress.yaml
kubectl apply -f azure-example-ingressroute.yaml
kubectl apply -f azure-example-middleware.yaml

~~~

