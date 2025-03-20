module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  tags                = var.tags
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  instance_type    = var.instance_type
  tags             = var.tags
}

module "rds" {
  source                 = "./modules/rds"
  vpc_id                = module.vpc.vpc_id
  private_subnet_id     = module.vpc.private_subnet_id
  ec2_security_group_id = module.ec2.ec2_sg_id
  db_username           = var.db_username
  db_password           = var.db_password
  tags                  = var.tags
}
