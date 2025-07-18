#!/bin/bash

echo "start minikube"
cd minikube
sh start-minikube.sh

echo "install envoy-gw"
cd ../envoy-gw
sh install-envoy-gw.sh

echo "install knative"
cd ../knative
sh install-knative.sh
