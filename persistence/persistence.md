# K8s Persistence

### Build azure vote example

~~~bash
PERSISTEMCE_FOLDER=$(pwd)
eval $(minikube docker-env)
cd /tmp
git clone https://github.com/Azure-Samples/azure-voting-app-redis.git
cd azure-voting-app-redis/azure-vote

docker build -t azure-vote-front:v1 .

~~~

## Persistence example
~~~bash
cd $PERSISTEMCE_FOLDER
kubectl apply -k pvc-example/
~~~

## Pv Pvc and storageclass
~~~bash
kubectl get sc
kubectl get pvc
kubectl get pv
~~~