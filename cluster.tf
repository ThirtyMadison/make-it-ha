module "eks_node_group" {
  source             = "cloudposse/eks-node-group/aws"
  subnet_ids         = data.terraform_remote_state.base.outputs.subnet_ids
  instance_types     = ["t3.medium"]
  desired_size       = 1
  min_size           = 1
  max_size           = 1
  cluster_name       = module.eks_cluster.eks_cluster_id
  kubernetes_version = local.kubernetes_version
}

module "eks_cluster" {
  source = "cloudposse/eks-cluster/aws"
  name       = "${local.name}${local.identifier}"
  region     = "us-east-2"
  vpc_id     = data.terraform_remote_state.base.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.base.outputs.subnet_ids

  kubernetes_version    = local.kubernetes_version
  workers_role_arns     = [module.eks_node_group.eks_node_group_role_arn]
}
