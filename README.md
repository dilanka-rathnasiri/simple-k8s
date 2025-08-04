# Simple K8s

A minimal, [Kubernetes](https://kubernetes.io/) cluster setup using Minikube to demonstrate essential tools for modern cloud native app development and deployment

## 🚀 Stack Overview

- **[Minikube](https://minikube.sigs.k8s.io/docs/):** Local Kubernetes cluster  
- **[Helm](https://helm.sh/):** Kubernetes package manager  
- **[Envoy Gateway](https://gateway.envoyproxy.io/):** Kubernetes native API Gateway  
- **[Knative Serving](https://knative.dev/docs/):** Serverless platform with scale-to-zero support  
- **[Headlamp](https://headlamp.dev/):** User-friendly Kubernetes dashboard  

## 🧱 Project Structure

- `app-deployment/` — Sample application deployed as both a Kubernetes service and a Knative service  
- `envoy-gw/` — Install and configure Envoy Gateway using Helm
- `headlamp/` — Headlamp installation with Helm and routing setup
- `knative/` — Install Knative Serving with Kourier ingress using knative-operator helm chart
- `minikube/` — Minikube start/delete scripts  
- `setup.sh` — Spin up the complete cluster  
- `clean-up.sh` — Tear down everything  

## ✅ Cluster Features

- Envoy Gateway as API gateway  
- Knative for serverless app deployment  
- Headlamp for Kubernetes dashboard  
- Sample app deployed in `app` namespace  
- All HTTP routing via Envoy  

## 🔗 Access Guide

```bash
# Port-forward Envoy Gateway
kubectl -n envoy-gw port-forward svc/envoy-api-gw 8000:80

# Access sample apps
curl localhost:8000/web-app-svc
curl localhost:8000/web-app-knative-svc

# Get Headlamp token
sh headlamp/get-token.sh

# Access Headlamp via:
curl localhost:8000/headlamp
```

## 🧰 Prerequisites

- Bash terminal  
- [kubectl](https://kubernetes.io/docs/tasks/tools/)  
- [Docker](https://www.docker.com/)  
- [Minikube](https://minikube.sigs.k8s.io/docs/)  
- [Helm](https://helm.sh/)  

## 🏁 Quick Start

```bash
sh setup.sh
```

## 🧹 Clean Up

```bash
sh clean-up.sh
```

## 📁 Key File Descriptions

### `app-deployment/`
- **app-deployment.yaml:**
  - Kubernetes Deployment for the sample application
  - Kubernetes objects defined in this file are:
    - Deployment: `web-app-deploy`
    - Service: `web-app-svc`
    - Http Route: `web-app-http-route`
  - Both deployments are used [dilankarathnasiri/simple-web-server](https://hub.docker.com/r/dilankarathnasiri/simple-web-server) docker image from [Simple Utils
GitHub repo](https://github.com/dilanka-rathnasiri/simple-utils)
- **app-ksvc.yaml:**
  - Knative serverless deployment for the sample application
  - Kubernetes objects defined in this file are:
    - Knative service: `web-app-knative-svc`
    - Http Route: `web-app-knative-http-route`
- **app-ns.yaml:**
  - Defines `app` namespace
  - All the application related resources except Http Routes are defined in `app` namespace
  - Http Routes are defined in `envoy-gw` namespace
- **app-reference-grant.yaml:**
  - `envoy-app-reference-grant` reference grant to allow traffic from envoy gateway to services in the app namespace
- **deploy-app.sh:**
  - Bash script to deploy sample applications
- **remove-app.sh:**
  - Bash script to remove deployed applications

### `envoy-gw/`
- **config-envoy-gw.yaml:**
  - Configuration for Envoy Gateway and related resources
  - Kubernetes objects defined in this file are:
    - Gateway Class: `envoy-gw`
    - Envoy Proxy: `envoy-gw-proxy-config`
    - Gateway: `envoy-gw`
    - HTTP Route Filter: `health-inline-response`
    - HTTP Route: `health-route` for health checks
    - HTTP Route Filter: `default-inline-response`
    - HTTP Route: `default-route` for when no matching route is found
- **envoy-gw-ns.yaml:**
  - Defines `envoy-gw` namespace
  - All the envoy gateway related resources and Http Routes are defined in `envoy-gw` namespace
- **install-envoy-gw.sh:**
  - Bash script to install and configure Envoy Gateway
- **remove-envoy-gw.sh:**
  - Bash script to uninstall Envoy Gateway and clean up resources

### `headlamp/`
- **headlamp-http-route.yaml:**
  - Define `headlamp-http-route`
- **headlamp-ns.yaml:**
  - Defines `headlamp` namespace
  - All the headlamp related resources are defined in `headlamp` namespace
- **headlamp-reference-grant.yaml:**
  - `envoy-headlamp-reference-grant` reference grant to allow traffic from envoy gateway to headlamp
- **install-headlamp.sh:**
  - Bash script to install and configure Headlamp dashboard
- **remove-headlamp.sh:**
  - Bash script to uninstall Headlamp and clean up resources
- **get-token.sh:**
  - Helper script to obtain authentication token for Headlamp dashboard
  - Creates and displays a service account token
- **values.yaml:**
  - Helm values configuration for Headlamp
  - Configures the base URL to `/headlamp`

### `knative/`
- **knative-configs.yaml:**
  - Configuration for Knative Serving with Kourier as the ingress
  - Disables Istio and enables Kourier with ClusterIP service type as the default ingress for Knative Serving
  - Configures the default domain settings
- **knative-ns.yaml:**
  - Defines Kubernetes namespaces for Knative components:
    - `knative-operator`: For the Knative Operator
    - `knative-serving`: For Knative Serving components
- **kourier-reference-grant.yaml:**
  - `envoy-kourier-reference-grant` reference grant to allow traffic from envoy gateway to kourier
- **install-knative.sh:**
  - Bash script to install and configure Knative Serving with Kourier
  - Sets up the Knative Operator and applies the serving configuration
  - Waits for Kourier gateway to be ready
- **remove-knative.sh:**
  - Bash script to uninstall Knative and clean up resources
- **kourier-wait/:**
  - Contains a Python script that waits for Kourier gateway to be ready
  - Used internally by the `install-knative.sh`

### `minikube/`

- **start-minikube.sh:**
  - Bash script to start a local Minikube cluster
- **delete-minikube.sh:**
  - Bash script to delete the local Minikube cluster
