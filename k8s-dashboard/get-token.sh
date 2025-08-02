#!/bin/bash

# Exit on error
set -e

# Set variables
export NAMESPACE="kubernetes-dashboard"
export SERVICE_ACCOUNT="admin-user"

# Get the token
TOKEN=$(kubectl -n kubernetes-dashboard create token admin-user)

# Display the token
echo ""
echo "=================================================="
echo " TOKEN FOR KUBERNETES DASHBOARD"
echo "=================================================="
echo $TOKEN
echo "=================================================="
echo ""
echo "Copy this token and use it to log in to the dashboard."
