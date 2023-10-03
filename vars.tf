# variable.tf

variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}



variable "key_name" {
  description = ssh-key-jen
  type        = string
}
