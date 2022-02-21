resource "aws_instance" "server1" {
  ami = "ami-054965c6cd7c6e462"
  instance_type = "t2.micro"
  count = 1
  subnet_id = "${aws_subnet.subnet1.id}" #mejor manera
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg-1.id}", "${aws_security_group.sg-2.id}"]
  #vpc_security_group_ids = [ "sg-0d578a793fff6230a", "sg-08695b6d6f39a6be3" ]
  private_ip = "10.0.10.10"
  key_name = "llaves"
  
  tags = {
    "Name" = "server1"
    "Owner" = "terraform"
    "Env" = "Dev"


  }
}