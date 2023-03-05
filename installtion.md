for installing ingress nginx controller

kubectl create namespace ingress-nginx


kubectl create configmap ingress-nginx-controller --namespace=ingress-nginx --from-literal=controller.publishService.enabled=true


kubectl apply -f mandatory.yaml

kubectl apply -f deploy.yml
