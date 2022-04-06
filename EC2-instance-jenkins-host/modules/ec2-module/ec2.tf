#EC2 instance that is used as the jenkins host
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Jenkins-host"

  ami                    = "ami-0069d66985b09d219"
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile_name

  tags = {
    name = "Jenkins-host-${var.env_suffix}"
  }
}
