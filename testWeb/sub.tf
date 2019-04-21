resource "aws_subnet" "subnet" {
  cidr_block = "10.1.1.0/24"
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "Webtest subnet"
  }
}