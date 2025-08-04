#!/bin/bash

echo "******* create headlamp namespace *******"
kubectl apply -f headlamp-ns.yaml

echo "******* install headlamp *******"
helm repo add headlamp https://headlamp-k8s.github.io/headlamp/
helm repo update
helm upgrade -i -n headlamp headlamp headlamp/headlamp --values values.yaml

echo "******* allow traffic from envoy-gw to headlamp *******"
kubectl apply -f headlamp-reference-grant.yaml

echo "******* configure http route *******"
kubectl apply -f headlamp-http-route.yaml
