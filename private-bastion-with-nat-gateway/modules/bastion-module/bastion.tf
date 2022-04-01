resource "aws_instance" "bastion" {
  ami                    = "ami-0960de83329d12f2f"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  iam_instance_profile   = var.iam_instance_profile_name

  tags = {
    "Name" = "Bastion_Host-${var.env_suffix}"
  }
}