#!/bin/bash

terraform apply -auto-approve

cd pa-config

terraform apply -var-file="../ips.tfvars" -auto-approve