#!/bin/bash

echo "******* create dashboard namespace *******"
kubectl apply -f k8s-dashboard-ns.yaml

echo "******* install kubernetes dashboard *******"
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm upgrade -i kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard \
  -n k8s-dashboard \
  --values values.yaml

echo "******* create admin user *******"
kubectl apply -f monitoring-user.yaml

echo "******* configure HTTPRoute for Envoy Gateway *******"
kubectl apply -f k8s-dashboard-httproute.yaml
