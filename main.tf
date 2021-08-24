module "eks-jx" {
  source                =   "jenkins-x/eks-jx/aws"
  version               =   "1.15.39"
  
  # Insert the 2 required variables here
  # See for variables
  cluster_version       =   "1.20"
  nginx_chart_version   =   "3.12.0"

  # Define a specific cluster name otherwise an auto-generate name will be used
  cluster_name          =   "jx-cluster-cn-cicd"
  
  # Default seem to point to us-east-1 so need to set this if other region is preferred
  region                =   "us-east-2"
}

terraform {
  backend "s3" {
    bucket          =   "jx-tf-state-files"
    key             =   "jx/terraform.tfstate"
    region          =   "us-east-2"
  }
}


output "jx_requirements" {
  value = module.eks-jx.jx_requirements
}