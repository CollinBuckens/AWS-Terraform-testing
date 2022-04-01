module "aws_vpc" {
  source                                         = "terraform-aws-modules/vpc/aws"
  create_vpc                                     = true
  cidr                                           = "10.0.0.0/16"
  public_subnets                                 = ["10.0.1.0/24"]
  private_subnets                                = ["10.1.0.0/24"]
  enable_ipv6                                    = true
  assign_ipv6_address_on_creation                = true
  private_subnet_assign_ipv6_address_on_creation = false

  tags = {
    name = "vpc_${var.env_suffix}"
  }
}