#!/bin/bash

cd envoy-gw
sh remove-envoy-gw.sh

cd ../minikube
sh delete-minikube.sh
