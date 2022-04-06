# main file that talks to all the modules and creates the infrastructure.
provider "aws" {
  region = "eu-west-1" # Ireland
  default_tags {       # Tags that are applied by default on every module.
    tags = {
      Terraform   = true
      Environment = "${module.shared_vars.env_suffix}"
    }
  }
}

module "shared_vars" {
  source = "./modules/shared-vars"
}

module "VPC_module" {
  source     = "./modules/vpc-module"
  env_suffix = module.shared_vars.env_suffix
  depends_on = [
    module.shared_vars,
  ]
}

module "ec2_module" {
  source                    = "./modules/ec2-module"
  env_suffix                = module.shared_vars.env_suffix
  subnet_id                 = module.VPC_module.vpc_public_subnet[0]
  vpc_security_group_ids    = module.security_groups_module.security_group_jenkins_id
  iam_instance_profile_name = module.iam_module.profile_name
  depends_on = [
    module.security_groups_module,
    module.VPC_module,
    module.shared_vars,
    module.iam_module
  ]
}

module "security_groups_module" {
  source        = "./modules/security-group-module"
  env_suffix    = module.shared_vars.env_suffix
  vpc_id        = module.VPC_module.vpc_id
  vpc_cidr      = module.VPC_module.vpc_cidr
  vpc_cidr_ipv6 = module.VPC_module.vpc_cidr_ipv6
  depends_on = [
    module.VPC_module,
    module.shared_vars
  ]
}

module "iam_module" {
  source     = "./modules/iam-module"
  env_suffix = module.shared_vars.env_suffix
  depends_on = [
    module.shared_vars
  ]
}