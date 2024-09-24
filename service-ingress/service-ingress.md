# K8s Serices and Ingresses

## Persistence example
~~~bash
kubectl apply -f nginx-ingress.yaml
kubectl apply -f azure-example-ingressroute.yaml
kubectl apply -f azure-example-middleware.yaml
kubectl apply -f azure-example-ingress.yaml
~~~

## Pv Pvc and storageclass
~~~bash
kubectl get sc
kubectl get pvc
kubectl get pv
~~~