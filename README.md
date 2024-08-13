# Simple K8s

Infrastructure as Code for deploying kubernetes dashboard and REST-API web services in a kubernetes cluster.

### How to use this project

This is an example cluster with infrastructure as code.
Feel free to change as you required and use for your projects.

### This project consists of

1. source code for node.js web services
2. Pulumi IaC for web service deployment
    - two microservices has been deployed
    - IaC for both kubernetes deployment and kubernetes service of each microservice
3. Pulumi IaC for [Kubernetes dashboard](https://github.com/kubernetes/dashboard) deployment
4. Pulumi IaC for a read-only user for accessing the kubernetes dashboard
5. Pulumi IaC for a long-lived bearer token of the read-only user

### Start a local Kubernetes cluster (Optional)

Start the local cluster with [kind](https://kind.sigs.k8s.io/) `kind create cluster --name simple-k8s`.
Also, [minikube](https://minikube.sigs.k8s.io/docs/) can be used.

### How to deploy Kubernetes dashboard

1. Navigate into `iac/k8s-dashboard`
2. execute `pulumi login --local` in terminal
3. execute `pulumi install` in terminal
4. execute `export PULUMI_CONFIG_PASSPHRASE=<your passphrase>` in terminal
5. execute `pulumi stack init <stack name>` in terminal
6. execute `pulumi preview --json` in terminal (optional)
7. execute `pulumi up --yes` in terminal

### How to access kubernetes dashboard

1. Get monitoring-user access token
   with `kubectl get secret monitoring-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d`
2. Start port forwarding
   with `kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443`
3. Open localhost:8443 on a web browser
4. Enter bearer access token in dashboard login

### Deploy web services

1. Navigate into `iac/app-deployment`
2. execute `pulumi install --local` in terminal
3. execute `pulumi install` in terminal
4. execute `export PULUMI_CONFIG_PASSPHRASE=<your passphrase>` in terminal
5. execute `pulumi stack init <stack name>` in terminal
6. execute `pulumi preview --json` in terminal (optional)
7. execute `pulumi up --yes` in terminal

### Cleaning Up

**For deleting web services:**

1. Navigate into `iac/app-deployment`
2. Execute `export PULUMI_CONFIG_PASSPHRASE=<your passphrase>` in terminal
3. Execute `pulumi destroy --yes` in terminal

**For deleting Kubernetes dashboard:**

1. Navigate into `iac/k8s-dashboard`
2. Execute `export PULUMI_CONFIG_PASSPHRASE=<your passphrase>` in terminal
3. Execute `pulumi destroy --yes` in terminal

**For deleting local cluster (Optional):**

Execute `kind delete cluster --name simple-k8s` in terminal
