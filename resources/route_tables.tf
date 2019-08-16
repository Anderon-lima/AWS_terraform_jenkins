# Define the route table
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.vpc_jenkins.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.subnet_publica.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}
