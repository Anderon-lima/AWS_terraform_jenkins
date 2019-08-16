# Define our VPC
resource "aws_vpc" "vpc_jenkins" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_jenkins"
  }
}