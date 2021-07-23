#!/bin/bash

set -euxo pipefail

git checkout main && git checkout . && git clean -df

terraform destroy -auto-approve
terraform apply -auto-approve

aws eks update-kubeconfig --name $(terraform output -raw cluster_name)

kubectl apply -f deployment.yaml

# clear history
history -c

exit
