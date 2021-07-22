#!/bin/bash

set -euxo pipefail

curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /bin

curl -LO https://github.com/tsenart/vegeta/releases/download/v12.8.4/vegeta_12.8.4_linux_amd64.tar.gz
tar -xzf vegeta*.tar.gz
sudo mv vegeta /bin
rm vegeta*.tar.gz

