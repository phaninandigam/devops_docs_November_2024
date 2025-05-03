variable "vpc_block" {
  description = "CIDR range"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "subnet_block" {
  description = "CIDR block of the subnet"
}

variable "subnet_name" {
  description = "Name of the VPC"
}

variable "availability_zone" {
    description = "The avaiblity zone"
}


variable "security_groups_group_name" {
  description = "security group name"
}

variable "security_groups_desc" {
  default = "Allow http and ssh ports"
  description = "security group name description"
}

variable "ssh_port" {
  default = "22"
  description = "SSH port"
}

variable "http_port" {
  default = "80"
  description = "HTTP port"
}

variable "protocol" {
  default = "tcp"
  description = "tcp protocol"
}

variable "traffic_from_anywhere" {
  default = ["0.0.0.0/0"]
  description = "Allow traffic from anywhere"
}


variable "ami_value" {
  description = "The AMI value"
}

variable "ec2_type" {}

variable "ec2_name" {
  # default = "Ec2_name"
}