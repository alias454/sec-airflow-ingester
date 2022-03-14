# Get VPC ID from VPC name
data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Manage AWS security group and allow all instances assigned to have full communication among them
resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = data.aws_vpc.selected_vpc.id

  tags = {
    Name = var.security_group_name
  }

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}