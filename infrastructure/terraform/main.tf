module "vpc" {
  source           = "./modules/vpc"
  vpc_cidr_block   = var.vpc_cidr_block
}

module "subnet" {
  source               = "./modules/subnet"
  vpc_id               = module.vpc.vpc_id
  subnet_cidr_block    = var.subnet_cidr_block
  availability_zone    = var.availability_zone
}

module "s3" {
  source         = "./modules/s3"
  bucket_name    = var.bucket_name
}

module "ec2" {
  source          = "./modules/ec2"
  instance_count  = var.instance_count
  instance_ami    = var.instance_ami
  instance_type   = var.instance_type
  subnet_id       = module.subnet.subnet_id
}

module "rds" {
  source                     = "./modules/rds"
  database_identifier        = var.database_identifier
  database_allocated_storage = var.database_allocated_storage
  database_engine            = var.database_engine
  database_instance_class    = var.database_instance_class
  database_security_group_id = module.rds_sg.security_group_id
  database_username          = var.database_username
  database_password          = var.database_password
}

resource "aws_security_group" "rds_sg" {
  vpc_id = module.vpc.vpc_id
  # Rules
}
