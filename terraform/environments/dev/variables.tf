variable "tags" {
  description = "Common tags applied to eks project's resources"

  type = map(string)

  default = {
    Environment = "dev"
    ManagedBy   = "infrafloww"
    Project     = "eks-ml-platform"
    Owner       = "Ujjwal"
  }
}

variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami" {
  description = "AWS region for all resources"
  type        = string
  default     = "ami-0236922087fa98b6e"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_pair" {
  description = "EC2 key pair for EC2 Instances"
  type        = string
  default     = "key-macmini.pem"
}
