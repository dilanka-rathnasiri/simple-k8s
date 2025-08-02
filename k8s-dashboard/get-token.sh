#!/bin/bash

echo "******* get token *******"
TOKEN=$(kubectl -n k8s-dashboard create token monitoring-user)

echo "******* token obtained *******"
echo $TOKEN
