terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
  vpc_id = var.vpc_id
}

module "security" {
  source = "./modules/security"
  vpc_id = var.vpc_id
}

module "ec2" {
  source       = "./modules/ec2"
  subnet_id    = module.network.subnet1_id
  ami_id       = module.network.rhel_ami
  key_name     = var.key_name
  instance_cnt = 2
}

module "alb" {
  source           = "./modules/alb"
  subnet_ids       = [module.network.subnet1_id, module.network.subnet2_id]
  vpc_id           = var.vpc_id
  instances        = module.ec2.instance_ids
  security_grp_ids = [module.security.alb_sg_id]
}
