# Using Jenkins-X for Cloud Native CI/CD

## Install Client Tools

`1.` AWS CLI - if using AWS otherwise see GCP documentation for installation.  

See this [reference](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html) for more details.
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip 
rm -rf awscliv2.zip 
sudo ./aws/install
```

`2.` Helm 

Install 

```
wget https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz 
tar -zxvf 
sudo mv linux-amd64/helm /usr/sbin/helm
```


`3.` jx  

```
curl -L https://github.com/jenkins-x/jx/releases/download/v3.2.186/jx-linux-amd64.tar.gz | \
  tar xzv
chmod +x jx 
sudo mv jx /usr/local/bin
```

`4.` eksctl  

```
curl --silent --location \
  "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | \
  tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
```

`5.` terraform

Download the terraform cli from [terraform website](https://www.terraform.io/downloads.html).  The link used below is from this site.

```
wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip
unzip <terraform zipped binary> 
sudo mv terraform /usr/bin/terraform
```

NOTE: There seem to be a bug in Terraform and requires this environment variable to be setup. Export the AWS region variable to a specific region where the cluster is to be setup: 

`export AWS_REGION="us-east-2"`
 

## Create Kubernetes (EKS) Cluster

`1.` Create Jenkins X infrastructure on AWS

- link to provisioning instructions using terraform module; create main.tf 

https://registry.terraform.io/modules/jenkins-x/eks-jx/aws/latest

- backend state files 
- output requirements


`2.` Create AWS bucket for storing terraform backend state files

```
aws s3api create-bucket --bucket jx-tf-state-files \
    --region us-east-2 \
    --create-bucket-configuration \
    LocationConstraint=us-east-2
```

`3.` Run init, apply 



### Clone jenkins-x/jenkins-x-boot-config

> Note: https://aws.amazon.com/blogs/apn/modernize-your-ci-cd-pipeline-using-jenkins-x-with-amazon-eks/

Modify `jx-requirements-eks.yml` with the following settings:




Setup of eks-jx terraform main.tf: 

https://registry.terraform.io/modules/jenkins-x/eks-jx/aws/latest?tab=inputs

The link above references a terraform module from github:

https://github.com/jenkins-x/terraform-aws-eks-jx



<br>

## Miscellaneous references:

https://aws.amazon.com/blogs/apn/modernize-your-ci-cd-pipeline-using-jenkins-x-with-amazon-eks/

https://marcincuber.medium.com/amazon-eks-upgrade-journey-from-1-19-to-1-20-78c9a7edddb5


https://faun.pub/terraform-remote-backend-demystified-cb4132b95057

https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/