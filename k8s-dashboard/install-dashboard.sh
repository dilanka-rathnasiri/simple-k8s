#!/bin/bash

echo "******* create dashboard namespace *******"
kubectl apply -f k8s-dashboard-ns.yaml

echo "******* install kubernetes dashboard *******"
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard \
  --namespace kubernetes-dashboard \
  --values values.yaml \
  --wait \
  --timeout 5m0s

echo "******* create admin user *******"
kubectl apply -f create-monitoring-user.yaml -n kubernetes-dashboard

echo "******* kubernetes dashboard installed successfully *******"
echo "To access the dashboard, run: kubectl proxy"
echo "Then open: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
