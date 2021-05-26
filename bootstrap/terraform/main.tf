terraform {
	backend "s3" {
		bucket = "plural-testing-sanjit-tf-state"
		key = "sanjit-test-cluster/bootstrap/terraform.tfstate"
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
  name = module.aws-bootstrap.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}


module "aws-bootstrap" {
  source = "./aws-bootstrap"

### BEGIN MANUAL SECTION <<aws-bootstrap>>

### END MANUAL SECTION <<aws-bootstrap>>


  vpc_name = "test_vpc_for_plural"
  dns_domain = "sanjitdutta.com"
  cluster_name = "sanjit-test-cluster"
  
  map_roles = [
    {
      rolearn = "arn:aws:iam::332124921534:role/sanjit-test-cluster-watchman"
      username = "watchman"
      groups = ["system:masters"]
    },
    {
      rolearn = "arn:aws:iam::332124921534:role/sanjit-test-cluster-console"
      username = "console"
      groups = ["system:masters"]
    }
  ]

}
