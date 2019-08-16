resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc_jenkins.id}"
  tags = {
    Name = "itergatway"
  }
}
