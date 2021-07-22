git checkout main
git checkout .
git clean -df

terraform apply --auto-approve

kubectl delete everything inside default ns

kubectl apply -f deployment.yaml

# clear history
history -c

exit
