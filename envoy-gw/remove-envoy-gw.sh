#!/bin/bash

echo "delete envoy gw configurations"
kubectl delete -f config-envoy-gw.yaml

echo "uninstall envoy gateway helm chart"
helm uninstall -n envoy-gw envoy-gw

echo "delete envoy namespace"
kubectl delete -f envoy-gw-ns.yaml
