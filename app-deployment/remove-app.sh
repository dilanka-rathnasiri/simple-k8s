#!/bin/bash

echo "delete reference grant"
kubectl delete -f reference-grant.yaml

echo "delete knative web app"
kubectl delete -f app-ksvc.yaml

echo "delete web app"
kubectl delete -f app-deployment.yaml

echo "delete app namespace"
kubectl delete -f app-ns.yaml
