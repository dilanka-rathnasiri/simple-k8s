#!/bin/bash

# install knative serving crds
echo "install knative serving crds"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.18.1/serving-crds.yaml

# install knative serving core components
echo "install knative serving core components"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.18.1/serving-core.yaml

# install kourier
echo "install kourier"
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.18.0/kourier.yaml

# change knative serving default to kourier
echo "change knative serving default to kourier"
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

# change kourier service to cluster ip
echo "change kourier service to cluster ip"
kubectl patch svc/kourier \
   --namespace kourier-system \
   --patch '{"spec": {"type": "ClusterIP"}}'

# Get kourier service
echo "Get kourier service"
kubectl --namespace kourier-system get service kourier

# enable knative hpa
echo "enable knative hpa"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.18.1/serving-hpa.yaml
