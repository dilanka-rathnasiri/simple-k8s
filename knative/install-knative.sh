#!/bin/bash

echo "create knative operator namespace"
kubectl apply -f knative-ns.yaml

echo "install knative"
helm repo add knative-operator https://knative.github.io/operator
helm upgrade -i knative-operator -n knative-operator knative-operator/knative-operator

echo "setup knative serving with kourier"
kubectl apply -f knative-configs.yaml

echo "allow traffic from envoy-gw to kourier"
kubectl apply -f kourier-reference-grant.yaml

echo "wait for kourier gateway to be ready"
cd kourier-wait
python3 -m venv venv
. venv/bin/activate
pip3 install -r -q requirements.txt
python3 main.py
cd ..
