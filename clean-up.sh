#!/bin/bash

echo "******* delete web app *******"
cd app-deployment
sh remove-app.sh

echo "******* remove knative *******"
cd ../knative
sh remove-knative.sh

echo "******* remove envoy-gw *******"
cd ../envoy-gw
sh remove-envoy-gw.sh

echo "******* delete minikube *******"
cd ../minikube
sh delete-minikube.sh
