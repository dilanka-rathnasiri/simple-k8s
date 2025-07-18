#!/bin/bash

echo "delete reference grant"
kubectl delete -f reference-grant.yaml

echo "delete knative serving"
kubectl delete -f knative-configs.yaml

echo "uninstall knative"
helm uninstall -n knative-operator knative-operator

echo "delete knative operator namespace"
kubectl delete -f knative-ns.yaml
