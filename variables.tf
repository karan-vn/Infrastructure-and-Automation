variable "aws_region" {
  description = "AWS region for this project"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type required by the assignment"
  type        = string
  default     = "t3.micro"
}

variable "ssh_allowed_cidr" {
  description = "Public IP range permitted to connect over SSH"
  type        = string
}