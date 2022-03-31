provider "aws" {
  region = "eu-west-3" # paris
  default_tags { # Tags that are applied by default on every module.
    tags = {
      Terraform = true
      Environment = "${module.shared_vars.env_suffix}"
    }
  }
}

module "shared_vars" {
  source = "./modules/shared-vars"
}