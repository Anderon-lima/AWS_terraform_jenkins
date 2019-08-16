#AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190627.1"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


#Jenkins
resource "aws_instance" "jenkins" {
  ami           = "${data.aws_ami.ubuntu.id}"
  availability_zone = "${var.aws_az}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]
  subnet_id = "${aws_subnet.subnet_publica.id}"
  associate_public_ip_address = true
  tags = {
      Name = "jenkins"
  }
  credit_specification {
    cpu_credits = "standard"
  }
  #user_data = "${file("../scripts/jenkins.sh")}"
}
