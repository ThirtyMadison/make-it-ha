#!/bin/bash

domain=$(kubectl get svc whoami-service -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

echo "Attacking $domain"

echo "GET http://$domain" | vegeta attack -duration=5s -rate=0 -max-workers 1024 | tee results.bin | vegeta report
