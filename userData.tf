resource "aws_instance" "server1" {
  ami = "${var.ami_id}"
  #terraform plan -var="ami_id=ami-054965c6cd7c6e462 NO ES EL METODO CORRECTO
  instance_type = "t2.micro"
  #count = 3
  count ="${length(var.subnet1_private_ip)}"
  subnet_id = "${aws_subnet.subnet1.id}" #mejor manera
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg-1.id}", "${aws_security_group.sg-2.id}"]
  #vpc_security_group_ids = [ "sg-0d578a793fff6230a", "sg-08695b6d6f39a6be3" ]
  #private_ip = "${var.subnet1_private_ip}"
  private_ip = "${element(var.subnet1_private_ip, count.index)}"
  key_name = "llaves" #${aws_key_pair.llaves.id}"    
  #comando para entrar ssh -i llaves.pem ec2-user@ec2-13-52-187-138.us-west-1.compute.amazonaws.com

  ##USER DATA##
  user_data = "${file("userdata.sh")}"
  
  tags = {
    "Name" = "server - ${count.index+1}"
    "Owner" = "terraform"
    "Env" = "Dev"
  }
}


#resource "aws_instance" "server2" {
#  ami = "ami-054965c6cd7c6e462"
#  instance_type = "t2.micro"
#  count = 1
#  subnet_id = "${aws_subnet.subnet1.id}" #mejor manera
#  associate_public_ip_address = true
#  vpc_security_group_ids = ["${aws_security_group.sg-1.id}", "${aws_security_group.sg-2.id}"]
#  #vpc_security_group_ids = [ "sg-0d578a793fff6230a", "sg-08695b6d6f39a6be3" ]
#  private_ip = "10.0.10.11"
#  key_name = "llaves" #${aws_key_pair.llaves.id}"    
#  #comando para entrar ssh -i llaves.pem ec2-user@ec2-13-52-187-138.us-west-1.compute.amazonaws.com

#  ##USERDATA##
#  user_data = <<EOF
##!/bin/bash
#export PATH=$PATH:/usr/local/bin
#sudo -i
#exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
#yum install -y httpd
#echo "<html><h1>hola, Excelente ejercicio... <p></p><p>Continuamos!!</p></h1></html>" > /var/www/html/index.html
#systemctl start httpd
#systemctl enable httpd
#echo "Hola Mundo" > hola.txt
#EOF
#
#  tags = {
#    "Name" = "server2"
#    "Owner" = "terraform"
#    "Env" = "Dev"
#  }
#}