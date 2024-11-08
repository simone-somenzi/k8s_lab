# Introduction to Helm

## Helm commands
~~~bash
helm repo list
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm repo update
helm list -A
helm template -n helm-lab example-tomcat bitnami/tomcat --create-namespace  | code -
helm upgrade --install -n helm-lab example-tomcat bitnami/tomcat --create-namespace --dry-run  | code -
helm upgrade --install -n helm-lab example-tomcat bitnami/tomcat --create-namespace 
https://github.com/bitnami/charts/blob/main/bitnami/tomcat/values.yaml
helm upgrade --install -n helm-lab example-tomcat-8081 bitnami/tomcat --values ./helm/bitnami-tomcat-values/values.yaml --create-namespace 
helm get values  -n helm-lab example-tomcat-8081
helm list -A
helm uninstall -n helm-lab example-tomcat
~~~

## Helm Create 
~~~bash
mkdir /tmp/helm
helm create /tmp/helm/example-helm
helm upgrade --install -n example-helm example-helm  /tmp/helm/example-helm  --create-namespace 
~~~

## Helm Dependency 
~~~bash
helm dependency build ./helm/nginx-custom-index
helm upgrade --install -n helm-nginx-1 helm-nginx-1 ./helm/nginx-custom-index --create-namespace 
helm upgrade --install -n helm-nginx-2 helm-nginx-2 ./helm/nginx-custom-index --values ./helm/nginx-custom-index/values-blue.yaml --create-namespace 
helm uninstall -n helm-nginx-1 helm-nginx-1
helm uninstall -n helm-nginx-2 helm-nginx-2
~~~
