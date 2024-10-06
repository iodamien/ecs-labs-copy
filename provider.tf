# esncf-001-999-sf-public-0
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = {
      atemi-id = "4994"
    }
  }
  #shared_credentials_files = ["/mnt/c/Users/hydros/.aws/credentials"]

}