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
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | \
  sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get install helm -y
```

NEED TO REWRITE THIS
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

> https://learn.hashicorp.com/tutorials/terraform/install-cli

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

#### Need to re-write this.

```
wget <terraform version> 

# e.g. https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip>

unzip <terraform zipped binary> 

sudo mv terraform /usr/bin/terraform

```

Export aws region: `export AWS_REGION="us-east-2"`

### Clone jenkins-x/jenkins-x-boot-config

> Note: https://aws.amazon.com/blogs/apn/modernize-your-ci-cd-pipeline-using-jenkins-x-with-amazon-eks/

Modify `jx-requirements-eks.yml` with the following settings:


