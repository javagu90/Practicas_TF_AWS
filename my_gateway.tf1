provider "aws" {
    region = "us-west-1"
}

#resource "aws_instance" "test" {
#  ami = "ami-054965c6cd7c6e462"
#  instance_type = "t2.micro"
#}

#creando VPC

resource "aws_vpc" "main"{
  cidr_block="10.0.0.0/16"
  enable_dns_hostnames = true

  tags ={
    Name ="vpc1"
  }
}

#creando subnets
resource "aws_subnet" "subnet1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block="10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-1b"
  tags={
    Name = "subnet1 en us-west-1b" 
  }  
}

resource "aws_subnet" "subnet2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block="10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-1c"
  tags={
    Name = "subnet2 en us-west-1c" 
  }  
}


#creando gateway
resource "aws_internet_gateway" "gw" {
  vpc_id ="${aws_vpc.main.id}"

  tags={
    Name ="gateway"
  }  
}

#creando route tables
resource "aws_route_table" "ruta" {
  vpc_id ="${aws_vpc.main.id}"
  route {
    cidr_block="0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "ruta 1"
  }
}

resource "aws_route_table_association" "table_subnet1" {
  subnet_id = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.ruta.id}" 
}

resource "aws_route_table_association" "table_subnet2" {
  subnet_id = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.ruta.id}" 
}

#creando  security groups
resource "aws_security_group" "sg-1"{
  name = "sg-pin-ssh"
  vpc_id = "${aws_vpc.main.id}"
  description = "Permitir ping y ssh"

  ingress {
    from_port = 22
    to_port = 22
    protocol ="tcp"
    cidr_block = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    cidr_block = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]
  }

  tags={
    Name= "ping & ssh"
  }
}