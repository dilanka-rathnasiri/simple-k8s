#!/bin/bash

echo "create envoy namespace"
kubectl apply -f envoy-gw-ns.yaml

echo "install envoy gateway"
helm upgrade -i -n envoy-gw envoy-gw oci://docker.io/envoyproxy/gateway-helm

echo "configure envoy gateway"
kubectl apply -f config-envoy-gw.yaml
