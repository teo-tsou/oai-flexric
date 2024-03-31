#!/bin/bash

POD_NAME=$(kubectl get pods -l app=oai-flexric -o jsonpath='{.items[0].metadata.name}' -n blueprint)

# If no pod is found, exit
if [[ -z "$POD_NAME" ]]; then
    echo "No pod found for deployment 'oai-flexric'. Exiting."
    exit 1
fi

kubectl exec -ti  $POD_NAME -n blueprint -- sh -c "cd /flexric/build/examples/xApp/ && bash"
