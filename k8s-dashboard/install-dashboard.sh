#!/bin/bash

# Exit on error
set -e

# Set variables
NAMESPACE="kubernetes-dashboard"
HELM_REPO_NAME="kubernetes-dashboard"
HELM_REPO_URL="https://kubernetes.github.io/dashboard/"
HELM_CHART="kubernetes-dashboard"
HELM_RELEASE="kubernetes-dashboard"

# Add the Kubernetes Dashboard Helm repository
echo "Adding Kubernetes Dashboard Helm repository..."
helm repo add $HELM_REPO_NAME $HELM_REPO_URL
helm repo update

# Create the namespace if it doesn't exist
echo "Creating namespace $NAMESPACE if it doesn't exist..."
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

# Install or upgrade the Kubernetes Dashboard
echo "Installing/Upgrading Kubernetes Dashboard..."
helm upgrade --install $HELM_RELEASE $HELM_REPO_NAME/$HELM_CHART \
  --namespace $NAMESPACE \
  --values values.yaml \
  --wait \
  --timeout 5m0s

# Create admin user
echo "Creating admin user..."
kubectl apply -f create-admin-user.yaml -n $NAMESPACE

echo "\nKubernetes Dashboard has been installed successfully!"
echo "To access the dashboard, run: kubectl proxy"
echo "Then open: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
echo "\nUse the token above to log in."
