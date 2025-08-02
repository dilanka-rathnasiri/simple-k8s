#!/bin/bash

# Exit on error
set -e

# Set variables
NAMESPACE="kubernetes-dashboard"
SERVICE_ACCOUNT="admin-user"

# Get the token
TOKEN=$(kubectl -n $NAMESPACE get secret $(kubectl -n $NAMESPACE get sa/$SERVICE_ACCOUNT -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}")

# Display the token
echo ""
echo "=================================================="
echo " TOKEN FOR KUBERNETES DASHBOARD"
echo "=================================================="
echo $TOKEN
echo "=================================================="
echo ""
echo "Copy this token and use it to log in to the dashboard."
