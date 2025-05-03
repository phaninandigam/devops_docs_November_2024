provider "aws" {
  region = var.region
}
variable "region" {
  default = "ap-south-1"
  description = "The default region"
}
variable "instance_name"{
  default = "terraform_instance"
  description = "This is the name of the server"
}
variable "instance_type" {
  default = "t2.micro"
  description = "This is the type of the instance"
}
locals {
  common_tags = {
    "name" = "TestInstance"
    "team" = "DevOps"
    "role" = "Devops-Engineer"
    "creation_date" = "date-${formatdate("DDMMYYYY", timestamp())}"
    #"Name" = element(["Devops", "developer", "Dev-sec-ops"], 1)
    "Name" = "${var.instance_name}-ec2-${var.instance_type}-${substr(timestamp(), 0, 10)}"
}
}
resource "aws_instance" "Locale_testing" {
  instance_type = var.instance_type
  tags = local.common_tags
  ami = data.aws_ami.pull_ami.id
}
data "aws_ami" "pull_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
   filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
output "ami" {
  value = data.aws_ami.pull_ami.id
}
data "aws_vpc" "pull_vpc" {
  default = true
}
output "VPC" {
  value = data.aws_vpc.pull_vpc.id
}