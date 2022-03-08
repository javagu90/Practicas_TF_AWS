variable "ami_id" {
  description = "ami ID para RH8"
  #type = string
  #default = "ami-054965c6cd7c6e462"
}
variable "region" {
  description = "Region a usar de AWS"
  #default = "us-west-1"

}
variable "vpc_cidr" {
  description = "VPC cdir"
  #default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  description = "SUBNET 1 cdir"
  #default = "10.0.10.0/24"
}

variable "subnet2_cidr" {
  description = "SUBNET 2 cdir"
  #default = "10.0.20.0/24"
}

variable "subnet1_zone_1b" {
  description = " Zona 1b - SUBNET 1"
  #default = "us-west-1b"
}

variable "subnet2_zone_1c" {
  description = " Zona 1c - SUBNET 2"
  #default = "us-west-1c"
}

#variable "subnet1_private_ip" {
 # description = "IP privada de la instancia"
#}
#######################

variable "subnet1_private_ip"{
  description = "Lista de IP para subnet 1"
  type = list
  default = ["192.168.10.11","192.168.10.12","192.168.10.13"]
}