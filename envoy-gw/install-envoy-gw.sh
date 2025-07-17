#!/bin/bash

echo "create envoy namespace"
kubectl create -f envoy-gw-ns.yaml

echo "install envoy gateway"
helm install eg oci://docker.io/envoyproxy/gateway-helm --version v1.4.2 -n kourier-system --create-namespace
