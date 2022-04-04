module "aws_vpc" {
  source                                         = "terraform-aws-modules/vpc/aws"
  create_vpc                                     = true
  cidr                                           = "10.1.0.0/16"
  azs                                            = ["eu-west-3a", "eu-west-3b"]
  public_subnets                                 = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnets                                = ["10.1.2.0/24", "10.1.3.0/24"]
  enable_ipv6                                    = false
  assign_ipv6_address_on_creation                = false
  private_subnet_assign_ipv6_address_on_creation = false

  tags = {
    name = "vpc_${var.env_suffix}"
  }
}

