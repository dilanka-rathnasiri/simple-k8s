#!/bin/bash

echo "******* install envoy gateway *******"
helm install eg oci://docker.io/envoyproxy/gateway-helm --version v1.4.2 -n kourier-system --create-namespace
