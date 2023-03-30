variable "vpc_cidr" {
  description = "IP CIDR range for the Security VPC" 
  type = string 
  default = "192.168.0.0/16"
}

variable "cidr_block_public" {
  description = "us-east-1a AZ"
  type = string 
  default = "192.168.1.0/24"
}

variable "cidr_block_private" {
  description = "us-east-1a AZ"
  type = string 
  default = "192.168.2.0/24"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

