kubectl get nodes

kubectl get pods -A

kubectl get deployments -A

kubectl get services -A

kubectl get namespaces

#если запущен minicube через докер и нужно получить его ip
minikube service nginx-load-balancer

#Дефолт репо для чартов
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

#Развернуть nginx из bitnami
helm install my-nginx bitnami/nginx

