#provider "aws" {
 #   region = "us-west-1"
   # access_key = "AKIAQQ4ZJPBRDWEOJFBI"
   # secret_key = "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" 
   #credenciales obtenidas de home/.aws/credentials
#}

resource "aws_instance" "test" {
  ami = "ami-054965c6cd7c6e462"
  instance_type = "t2.micro"
}
