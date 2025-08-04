#!/bin/bash

echo "******* delete reference grant *******"
kubectl delete -f headlamp-reference-grant.yaml

echo "******* delete http route *******"
kubectl delete -f headlamp-http-route.yaml

echo "******* uninstall headlamp *******"
helm uninstall -n headlamp headlamp

echo "******* delete headlamp namespace *******"
kubectl delete -f headlamp-ns.yaml
