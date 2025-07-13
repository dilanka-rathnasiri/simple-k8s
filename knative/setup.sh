#!/bin/bash

sh start-minikube.sh
sh install-knative.sh
sh install-envoy-gw.sh
kubectl apply -f envoy-gw/envoy-gw.yaml
