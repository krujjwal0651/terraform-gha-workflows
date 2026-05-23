# Resource: EC2 Instance
resource "aws_instance" "bastion_host" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
  key_name               = var.ec2_key_pair
  vpc_security_group_ids = [aws_security_group.web_sg.id, aws_security_group.ssh_sg.id]
  tags = merge(var.tags, {
    Name = "Bastion Host"
  })
}

# Resource : Security Group for SSH

resource "aws_security_group" "ssh_sg" {
  name        = "ssh_sg"
  description = "Allow SSH inbound traffic and all outbound traffic"
  tags = merge(var.tags, {
    Name = "ssh_sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "ssh_sg_allow_ssh_ipv4" {
  security_group_id = aws_security_group.ssh_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "ssh_sg_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ssh_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Resource : Security Group for HTTP/HTTPS

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and HTTPS inbound traffic and all outbound traffic"

  tags = merge(var.tags, {
    Name = "web_sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_allow_http_ipv4" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_allow_https_ipv4" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "web_sg_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
