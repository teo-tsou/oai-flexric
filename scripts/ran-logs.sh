#!/bin/bash
POD_NAME=$(kubectl get pods -l app=oai-gnb -o jsonpath='{.items[0].metadata.name}' -n blueprint) 

# If no pod is found, exit
if [[ -z "$POD_NAME" ]]; then
    echo "No pod found for deployment 'oai-gnb'. Exiting."
    exit 1
fi

# Fetch logs from the pod
kubectl logs -f  $POD_NAME -n blueprint
