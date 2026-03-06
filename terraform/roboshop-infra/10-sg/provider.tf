terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.0.0"
    }
  }
  backend "s3" {
    bucket = "daws86s-akhil"
    key = "sg-test"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
    region = "us-east-1"
}