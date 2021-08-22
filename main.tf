module "eks-jx" {
  source                =   "jenkins-x/eks-jx/aws"
  version               =   "1.15.39"
  
  # insert the 2 required variables here
  cluster_version       =   "1.20"
  nginx_chart_version   =   "3.12.0"

  # cluster name otherwise an auto-generate name will be used
  cluster_name          =   "jx-cluster-cn-cicd"
  region                =   "us-east-2"
}

terraform {
  backend "s3" {
    bucket          =   "jx-tf-state-files"
    key             =   "jx/terraform.tfstate"
    region          =   "us-east-2"
  }
}
