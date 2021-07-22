#!/bin/bash

set -eo pipefail

git checkout main && git checkout . && git clean -df

terraform destroy -auto-approve
terraform apply -auto-approve

kubectl apply -f deployment.yaml

# clear history
history -c

exit
