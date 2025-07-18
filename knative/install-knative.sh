#!/bin/bash

echo "create knative operator namespace"
kubectl create -f knative-operator-ns.yaml

echo "install knative"
helm repo add knative-operator https://knative.github.io/operator
helm install knative-operator -n knative-operator knative-operator/knative-operator

echo "setup knative serving with kourier"
kubectl apply -f knative-configs.yaml

echo "allow traffic from envoy-gw to kourier"
kubectl create -f reference-grant.yaml
