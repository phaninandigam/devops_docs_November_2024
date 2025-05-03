provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "first" {
    ami = var.ami_value
    instance_type = var.type_value
  
}
