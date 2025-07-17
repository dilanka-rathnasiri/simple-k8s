#!/bin/bash

echo "create envoy namespace"
kubectl create -f envoy-gw-ns.yaml

echo "install envoy gateway"
helm install envoy-gw oci://docker.io/envoyproxy/gateway-helm -n envoy-gw

echo "configure envoy gateway"
kubectl apply -f config-envoy-gw.yaml
