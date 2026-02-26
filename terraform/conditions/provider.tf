terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.0.0"
    }
  }

  backend "s3" {
    bucket = "bucket-name"
    key = "state-file name"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    
  }
}

provider "aws" {
  
}