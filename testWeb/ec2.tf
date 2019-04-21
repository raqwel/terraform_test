resource "aws_instance" "WebTest" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet.id}"
  security_groups = [
    "${aws_security_group.sg.id}"
  ]
  key_name = "${aws_key_pair.auth.key_name}"
  private_ip = "10.1.1.10"
  associate_public_ip_address = true

  tags {
    Name = "WebTest"
  }
}

resource "aws_key_pair" "auth" {
  key_name = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}