provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "instance_block" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "${local.instance[terraform.workspace]}"
    tags = {
      Name ="env-name_instance"
    }
  
}

locals {
  instance = {
    "default" = "t2.micro"
    "dev" = "t2.micro"
    "staging" = "t3.small"
    "prod" = "t3.medium"

  }
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "${terraform.workspace}-terraform-test-06032025"
}

terraform {
  backend "s3" {
    bucket = "workspace-statefiles" #bucketname
    key = "statefile" #path
    region = "ap-south-1"
    # dynamodb_table = "terraform_state_lock_file"
    use_lockfile = true
  }
}