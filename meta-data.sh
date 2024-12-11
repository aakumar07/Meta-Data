#!/bin/bash

# Define the metadata endpoint
METADATA_URL="http://169.254.169.254/latest/meta-data"

# Get instance metadata and store it in JSON format
# here i am adding the small field only 

INSTANCE_ID=$(curl -s $METADATA_URL/instance-id)
INSTANCE_TYPE=$(curl -s $METADATA_URL/instance-type)
PUBLIC_IP=$(curl -s $METADATA_URL/public-ipv4)
PRIVATE_IP=$(curl -s $METADATA_URL/local-ipv4)
AMI_ID=$(curl -s $METADATA_URL/ami-id)
REGION=$(curl -s $METADATA_URL/placement/availability-zone)

# Construct the JSON output
cat <<EOF
{
  "instance_id": "$INSTANCE_ID",
  "instance_type": "$INSTANCE_TYPE",
  "public_ip": "$PUBLIC_IP",
  "private_ip": "$PRIVATE_IP",
  "ami_id": "$AMI_ID",
  "region": "$(echo $REGION | sed 's/.$//')"
}
EOF