resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = var.subnet_block
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "test_sg" {
  name = var.security_groups_group_name
  description = var.security_groups_desc
  vpc_id = aws_vpc.test_vpc.id
  ingress {
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = var.protocol
    cidr_blocks = var.traffic_from_anywhere
  }

    ingress {  #allowing http port
    from_port = var.http_port
    to_port = var.http_port
    protocol = var.protocol
    cidr_blocks = var.traffic_from_anywhere #from anywhere
    }

}


resource "aws_instance" "workspace_instance" {
  ami = var.ami_value
  instance_type = var.ec2_type
  subnet_id = aws_subnet.test_subnet.id
  security_groups = [aws_security_group.test_sg.id]
  availability_zone = aws_subnet.test_subnet.availability_zone
  tags = {
    Name = var.ec2_name
  }
}