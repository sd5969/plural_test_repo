terraform {
	backend "s3" {
		bucket = "plural-testing-sanjit-tf-state"
		key = "sanjit-test-cluster/console/terraform.tfstate"
		region = "us-east-1"
	}

	required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36.0"
    }
		kubernetes = {
			source  = "hashicorp/kubernetes"
			version = "~> 2.0.3"
		}
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster" "cluster" {
  name = "sanjit-test-cluster"
}

data "aws_eks_cluster_auth" "cluster" {
  name = "sanjit-test-cluster"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}


module "aws" {
  source = "./aws"

### BEGIN MANUAL SECTION <<aws>>

### END MANUAL SECTION <<aws>>


  cluster_name = "sanjit-test-cluster"
  namespace = "console"

}
