# Workload 


## Deployment commands
~~~bash
kubectl create deployment imperative-nginx  --image nginx -n lab
kubectl get deployments.apps -n lab -o wide
kubectl scale deployment --replicas 3 -n lab imperative-nginx 
kubectl get pod -n lab
kubectl delete pod -n lab --all
kubectl rollout history -n lab deployment/imperative-nginx 
kubectl -n lab set image deployments/imperative-nginx nginx=nginx:1.26
kubectl get deployments.apps  -n lab imperative-nginx -o json -o jsonpath="{.spec..template.spec.containers[*].image}"
kubectl rollout history -n lab deployment/imperative-nginx 
kubectl rollout restart -n lab deployment/imperative-nginx 
kubectl rollout undo -n lab deployment/imperative-nginx 
kubectl get deployments.apps  -n lab imperative-nginx -o json -o jsonpath="{.spec..template.spec.containers[*].image}"
~~~

## Configmap and secret commands
~~~bash
kubectl create configmap test-cm --from-literal COLOR=RES --from-literal ENV=DEV  -o yaml --dry-run=client
kubectl create cm nginx-png-cn --from-file deployment-example/aifactory-brain.png -o yaml --dry-run=client > deployment-example/nginx-png-cm.yaml 
kubectl create secret generic nginx-secret --from-literal PASSWORD=P@ssw0rd -o yaml --dry-run=client 
~~~

## Workload example
~~~bash
kubectl apply -k deployment-example/
k get secrets  -n example-workload  nginx-secret -o jsonpath="{.data.PASSWORD}" | base64 -d
~~~

## RBAC example
~~~bash
kubectl api-resources
kubectl api-resources --namespaced=true

kubectl apply -k rbac-example

~~~