#!/bin/bash

echo "******* create app namespace *******"
kubectl apply -f app-ns.yaml

echo "******* deploying web app *******"
kubectl apply -f app-deployment.yaml

echo "******* deploy knative web app *******"
kubectl apply -f app-ksvc.yaml

echo "******* allow traffic from envoy-gw to app namespace *******"
kubectl apply -f app-reference-grant.yaml
