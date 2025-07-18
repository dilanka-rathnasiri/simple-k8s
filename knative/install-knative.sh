#!/bin/bash

echo "create knative operator namespace"
kubectl apply -f knative-ns.yaml

echo "install knative"
helm repo add knative-operator https://knative.github.io/operator
helm upgrade -i knative-operator -n knative-operator knative-operator/knative-operator

echo "setup knative serving with kourier"
kubectl apply -f knative-configs.yaml

echo "allow traffic from envoy-gw to kourier"
kubectl apply -f reference-grant.yaml

echo "wait for knative serving to be ready"
kubectl wait --for=condition=Available --timeout=300s deployment --all -n knative-serving
