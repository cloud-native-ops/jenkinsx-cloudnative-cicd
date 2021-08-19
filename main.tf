module "eks-jx" {
  source  = "jenkins-x/eks-jx/aws"
  version = "1.15.28"
  # insert the 2 required variables here
  cluster_version      = "1.20"
  nginx_chart_version  = "3.12.0"

  # optional; by specifying cluster name, this prevents the auto-generation of cluster name
  cluster_name = "jx-cluster-cn-cicd"
}

terraform {
  backend "s3" {
    bucket         = "jx-tf-state-files"
    # prefix         = "terraform/state"
    key            = "jx/terraform.tfstate"
    region         = "us-east-2"
  }
}