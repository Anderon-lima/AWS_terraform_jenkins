# Define the public subnet
resource "aws_subnet" "subnet_publica" {
  vpc_id = "${aws_vpc.vpc_jenkins.vpc_id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.aws_az}"

  tags = {
    Name = "jenkins_subnet"
  }
}