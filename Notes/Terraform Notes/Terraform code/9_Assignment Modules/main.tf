provider "aws" {
  region = "ap-south-1"
}


module "ec2_creation" {
  source = "github.com/phaninandigam/Terraform_Modules_NPR/ec2_creation"
  # source = "./Modules/ec2_creation"
  vpc_block = var.cidr_block
  vpc_name =  format("%s_%s","${terraform.workspace}",var.vpc_name)
  subnet_block = var.subnet_range
  subnet_name = format("%s_%s","${terraform.workspace}",var.subnet_name)
  availability_zone = var.availability_zone
  security_groups_group_name = var.security_groups_name
  security_groups_desc = var.security_groups_desc
  ami_value = "ami-00bb6a80f01f03502"
  ec2_type = var.type
  ec2_name = format("%s_%s","${terraform.workspace}","ec2-Instance")
}

terraform {
  backend "s3" {
    bucket = "modules-workspace-tfstate-files" #bucketname
    key = "statefiles" #path
    region = "ap-south-1"
    # dynamodb_table = "terraform_state_lock_file"
    use_lockfile = true
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