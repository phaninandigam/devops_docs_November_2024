variable "cidr_block" {
  description = "Enter the CIDR range for the VPC"
}

variable "vpc_name" {
  default = "test_vpc"
}

variable "subnet_range" {
  description = "Enter the subnet block range"
}

variable "subnet_name" {
  default = "test_subnet"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "security_groups_name" {
  default = "Test_SG"
  description = "The name of the security group"
}

variable "security_groups_desc" {
  default = "Allowing ssh and http ports"
}

variable "type" {
  description = "Enter the instance type"
}
