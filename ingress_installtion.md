for installing ingress nginx controller

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

points to note:

Add A record for your hostname to node IPs.


Install certificate manager
If you want to use HTTPS with your Ingress, you will need to install a certificate manager. Run the following command to install the Jetstack cert-manager:

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.yaml
This will install the cert-manager as a Deployment in your cluster.

Create Clusterissuer
After you have installed the cert-manager, you can create a Clusterissuer to issue SSL certificates for your Ingress. Run the following commands to create the staging and production Clusterissuers:

kubectl apply -f staging_issuer.yaml
kubectl apply -f prod_issuer.yaml
These commands will create two Clusterissuers, one for staging and one for production.
