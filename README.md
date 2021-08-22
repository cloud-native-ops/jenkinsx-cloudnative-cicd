# Using Jenkins-X for Cloud Native CI/CD

### Install Client Tools
`1.` AWS CLI - if using AWS otherwise see GCP documentation for installation.  

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip 
rm -rf awscliv2.zip 
sudo ./aws/install
```

`2.` Helm 
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

```
wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip
unzip <terraform zipped binary> 
sudo mv terraform /usr/bin/terraform
```

NOTE: There seem to be a bug in Terraform and requires this environment variable setup. 
Export the AWS region: 

`export AWS_REGION="us-east-2"`
 

### Clone jenkins-x/jenkins-x-boot-config

> Note: https://aws.amazon.com/blogs/apn/modernize-your-ci-cd-pipeline-using-jenkins-x-with-amazon-eks/

Modify `jx-requirements-eks.yml` with the following settings:

Setup of terraform main.tf.

https://registry.terraform.io/modules/jenkins-x/eks-jx/aws/latest?tab=inputs


