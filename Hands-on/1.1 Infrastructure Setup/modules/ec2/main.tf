resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "EC2-Security-Group" })
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with latest AMI ID
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [aws_security_group.ec2_sg.name]
  tags = merge(var.tags, { Name = "Public-EC2" })
}
