#!/bin/bash

cd minikube
sh start-minikube.sh

cd ../envoy-gw
sh install-envoy-gw.sh
