#!/bin/bash

echo "******* create dashboard namespace *******"
kubectl apply -f k8s-dashboard-ns.yaml

echo "******* install kubernetes dashboard *******"
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm upgrade -i kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard \
  -n k8s-dashboard \
  --values values.yaml \
  --wait \
  --timeout 5m0s

echo "******* create admin user *******"
kubectl apply -f monitoring-user.yaml
