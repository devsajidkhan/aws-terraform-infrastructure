provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "subnet" {
  source  = "./subnet"
  vpc_id  = module.vpc.vpc_id
}

module "security_group" {
  source  = "./security_group"
  vpc_id  = module.vpc.vpc_id
}

module "instance" {
  source               = "./instance"
  subnet_id            = module.subnet.subnet_id
  security_group_ids   = [module.security_group.security_group_id]
}
