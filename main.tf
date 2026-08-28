provider "aws" {
  region = "us-east-1"
}

# vpc
module "main_aws_vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
}


# networking
module "networking" {
  source = "./modules/networking"

  vpc_id            = module.main_aws_vpc.vpc_id
  public_cidr_block = "10.0.0.0/24"
}


# rules
module "security_group" {
  source = "./modules/security_group"

  vpc_id   = module.main_aws_vpc.vpc_id
  ssh_cidr = var.ssh_cidr
}


# instance
module "instance" {
  source = "./modules/instance"

  public_subnet_id  = module.networking.public_subnet_id
  security_group_id = module.security_group.security_group_id
  ami               = "ami-03ceeebf93c41fdae"
  instance_type     = "t3.micro"
  instance_name     = "main_instance"
}


# variables
variable "ssh_cidr" {
  description = "Public IPv4 CIDR permitted to connect over SSH"
  type        = string
}

# outputs
output "instance_public_ip" {
  value = module.instance.instance_public_ip
}
