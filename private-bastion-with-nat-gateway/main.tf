provider "aws" {
  region = "eu-west-3" # paris
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

module "bastion_module" {
  source                    = "./modules/bastion-module"
  env_suffix                = module.shared_vars.env_suffix
  subnet_id                 = module.VPC_module.aws_vpc_private_subnet[0]
  vpc_security_group_ids    = module.security_groups_module.security_group_bastion_id
  iam_instance_profile_name = module.iam_module.profile_name
  depends_on = [
    module.security_groups_module,
    module.VPC_module,
    module.shared_vars,
    module.iam_module
  ]
}

module "security_groups_module" {
  source            = "./modules/security-groups-module"
  env_suffix        = module.shared_vars.env_suffix
  aws_vpc_id        = module.VPC_module.aws_vpc_id
  aws_vpc_cidr      = module.VPC_module.aws_vpc_cidr
  aws_vpc_cidr_ipv6 = module.VPC_module.aws_vpc_cidr_ipv6
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

module "nat_gateway_module" {
  source     = "./modules/nat-gateway-module"
  env_suffix = module.shared_vars.env_suffix
  subnet_id  = module.VPC_module.aws_vpc_public_subnet[0]
  bastion_id = module.bastion_module.bastion_id
  depends_on = [
    module.VPC_module,
    module.shared_vars,
    module.bastion_module
  ]
}