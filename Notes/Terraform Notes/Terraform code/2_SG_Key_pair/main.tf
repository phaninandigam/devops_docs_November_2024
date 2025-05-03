provider "aws" {
  # access_key = "AKIA47CRW"
  # secret_key = "R8OwUhVf42Vr9"
  region     = "ap-south-1"
}

resource "aws_instance" "ourfirst" {
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"
  # key_name = "Testing_Key_pair1"
  key_name = "Test_Key_Pair"
  tags = {
    Name = "Terraform-Instance"  #this will be name of the ec2 instance
  }
  # security_groups = ["${aws_security_group.terraform_security_group.name}"]
  security_groups = ["SecurityGroup1"]

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install zip -y
  sudo apt install apache2 -y
  cd /var/www/html/
  sudo rm index.html 
  sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip
  sudo unzip neogym.zip
  sudo cp -r neogym-html/* .
  EOF
}

#passing the key pair values directly
resource "aws_key_pair" "terrform_key_pair" {
  key_name = "Testing_Key_pair"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILW25lLS+wWjtcJVMHUsXtZl/f1esl7ryi+5SmptCeh8 phaninandigam@FVFHL0LQQ05D"
}

#passing the key pair values from the file
resource "aws_key_pair" "terrform_key_pair1" {
  key_name = "Testing_Key_pair1"
  public_key = "${file("terraform_key_pair.pub")}"
}


#security group creation
resource "aws_security_group" "terraform_security_group" {
  name = "Testing_Security_Group"
  description = "Allowing SSH and HTTP ports"
  
  ingress {  #allowing ssh port
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #from anywhere
  }

  ingress {  #allowing http port
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #from anywhere
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1" #  any port
    cidr_blocks = ["0.0.0.0/0"] # anywhere
  }

}