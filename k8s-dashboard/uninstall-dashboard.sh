#!/bin/bash

echo "******* uninstall kubernetes dashboard *******"
helm uninstall -n k8s-dashboard kubernetes-dashboard

echo "******* delete dashboard namespace *******"
kubectl delete -f k8s-dashboard-ns.yaml
