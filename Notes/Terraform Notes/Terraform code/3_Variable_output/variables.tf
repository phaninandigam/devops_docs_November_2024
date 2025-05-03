variable "ami_value" {
  default = "ami-00bb6a80f01f03502"
  description = "image type value"
  sensitive = false
}

variable "type_value" {
    default = "t2.micro"
    description = "The type of ths instance"
    sensitive = false
  
}