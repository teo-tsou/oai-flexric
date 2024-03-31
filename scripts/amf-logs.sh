#!/bin/bash

# Define the namespace
NAMESPACE="blueprint"

# Use the specific labels to accurately target the oai-amf pods
LABEL_SELECTOR="app.kubernetes.io/instance=oai-core,app.kubernetes.io/name=oai-amf"

# Get the name of the first oai-amf pod
# This command selects the first pod based on the label and extracts its name
POD_NAME=$(kubectl get pods -l ${LABEL_SELECTOR} -n ${NAMESPACE} -o jsonpath='{.items[0].metadata.name}')

# If no pod is found, exit
if [[ -z "$POD_NAME" ]]; then
    echo "No oai-amf pod found for deployment 'oai-core' in namespace '${NAMESPACE}'. Exiting."
    exit 1
fi

# Fetch logs from the oai-amf pod
kubectl logs -f $POD_NAME -n ${NAMESPACE}
