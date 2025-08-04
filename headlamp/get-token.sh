#!/bin/bash

echo "******* get token *******"
TOKEN=$(kubectl -n headlamp create token headlamp)

echo "******* token obtained *******"
echo $TOKEN
