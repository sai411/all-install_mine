Lagecy installations using package managers have been deprecated use this steps without package manager from here 
https://v1-28.docs.kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
script is availble at install-utilities_k8s.sh

RBAC:  https://aungzanbaw.medium.com/a-step-by-step-guide-to-creating-users-in-kubernetes-6a5a2cfd8c71
-----
apt-get update
apt-get install -y docker.io
apt-get update 
apt-get install -y apt-transport-https
apt-get install -y curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl

# only in master
# Update the n/w cidr
kubeadm init --pod-network-cidr=10.0.0.0/16
#To start using your cluster, you need to run (as a regular user):
#  mkdir -p $HOME/.kube
#  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#  sudo chown $(id -u):$(id -g) $HOME/.kube/config
#You should now deploy a pod network to the cluster.
#Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
#  https://kubernetes.io/docs/concepts/cluster-administration/addons/
calico : curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/calico.yaml -O (it will reconfigure ip automatically used as pod-cidr)
