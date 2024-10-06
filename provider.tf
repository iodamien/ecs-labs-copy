#becareful you need to fix the version of provider, don't do that in production lul.

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