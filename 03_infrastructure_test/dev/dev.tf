module "main-vpc" {
  source     = "../modules/vpc"
  ENV        = "dev"
  aws_region = var.aws_region
}

module "instances" {
  source          = "../modules/instances"
  ENV             = "dev"
  vpc-id          = module.main-vpc.vpc_id
  public-subnets  = module.main-vpc.public-subnets
}

module "database" {
  source          = "../modules/database"
  ENV             = "dev"
  vpc-id          = module.main-vpc.vpc_id
  private-subnets = module.main-vpc.private-subnets
}