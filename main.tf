# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Find the existing default VPC
data "aws_vpc" "default" {
  default = true
}

# Find the existing default subnets in that VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# Find the latest available Ubuntu 20.04 LTS AMD64 image
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Create a security group in the default VPC
resource "aws_security_group" "nginx_sg" {
  name        = "terraform-nginx-security-group"
  description = "Allow HTTP and restricted SSH access"
  vpc_id      = data.aws_vpc.default.id

  # Allow website traffic
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH from the specified public IP
  ingress {
    description = "SSH access from permitted IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  # Allow outbound traffic for package installation and updates
  egress {
    description = "Allow outbound IPv4 traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "terraform-nginx-security-group"
    Project   = "terraform-nginx-ubuntu"
    ManagedBy = "Terraform"
  }
}

# Launch the Ubuntu EC2 instance
resource "aws_instance" "nginx_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true

  # Install Nginx and publish the custom page on first boot
  user_data = <<-EOF
    #!/bin/bash
    set -eux

    export DEBIAN_FRONTEND=noninteractive

    apt-get update
    apt-get install -y nginx

    cat > /var/www/html/index.html <<'HTML'
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Terraform Nginx Server</title>
    </head>
    <body>
      <h1>Welcome to the Terraform-managed Nginx Server on Ubuntu</h1>
    </body>
    </html>
    HTML

    systemctl enable nginx
    systemctl restart nginx
  EOF

  tags = {
    Name      = "terraform-nginx-ubuntu"
    Project   = "terraform-nginx-ubuntu"
    ManagedBy = "Terraform"
  }
}