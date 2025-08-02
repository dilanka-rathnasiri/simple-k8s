#!/bin/bash

# Exit on error
set -e

# Set variables
NAMESPACE="kubernetes-dashboard"
HELM_RELEASE="kubernetes-dashboard"

# Uninstall the Helm release
echo "Uninstalling Kubernetes Dashboard..."
if helm list -n $NAMESPACE | grep -q $HELM_RELEASE; then
    helm uninstall $HELM_RELEASE -n $NAMESPACE
else
    echo "Helm release $HELM_RELEASE not found in namespace $NAMESPACE"
fi

# Optionally, delete the namespace
# Uncomment the following lines if you want to delete the namespace as well
# echo "Deleting namespace $NAMESPACE..."
# kubectl delete namespace $NAMESPACE

echo "Kubernetes Dashboard has been uninstalled successfully!"
echo "Note: The namespace $NAMESPACE has been preserved. To delete it, uncomment the relevant lines in this script."
