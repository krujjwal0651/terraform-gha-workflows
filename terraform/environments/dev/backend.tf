terraform {
  backend "s3" {
    bucket       = "ujjwal-eks-ml-dev-tfstate"
    key          = "dev/eks-cluster/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
