#terraform plan -var-file all_vars.tfvars
#terraform apply -var-file all_vars.tfvars -auto-approve
region             = "us-west-1"
ami_id             = "ami-054965c6cd7c6e462"
vpc_cidr           = "192.168.0.0/16"
subnet1_cidr       = "192.168.10.0/24"
subnet2_cidr       = "192.168.20.0/24"
subnet1_zone_1b    = "us-west-1b"
subnet2_zone_1c    = "us-west-1c"
subnet1_private_ip = "192.168.10.10"
