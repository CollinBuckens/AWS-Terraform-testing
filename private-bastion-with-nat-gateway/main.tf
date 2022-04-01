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
  source     = "./modules/VPC_module"
  env_suffix = module.shared_vars.env_suffix
  depends_on = [
    module.shared_vars,
  ]
}

module "bastion_module" {
  source                    = "./modules/bastion-module"
  env_suffix                = module.shared_vars.env_suffix
  subnet_id                 = module.VPC_module.aws_vpc_public_subnet[0]
  VPC_security_group_ids    = module.security_groups_module.security_group_bastion_id
  iam_instance_profile_name = module.iam_module.profile_name
  depends_on = [
    module.security_groups_module,
    module.VPC_module,
    module.shared_vars,
    module.iam_module
  ]
}