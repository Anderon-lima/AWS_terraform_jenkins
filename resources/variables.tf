variable "aws_region" {
  description = "Regiao para a VPC"
  default = "us-east-2"
}

variable "aws_az" {
  description = "Availability Zone para todos os servicos"
  default = "us-east-2a"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = "jenkins_terraorm"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}
