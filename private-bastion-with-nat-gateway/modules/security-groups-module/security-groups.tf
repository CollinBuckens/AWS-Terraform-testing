resource "aws_security_group" "Security_Group_bastion" {
  name   = "security-group-bastion"
  vpc_id = var.aws_vpc_id
  tags = {
    Name        = "security_group_bastion_${var.env_suffix}"
    Terraform   = true
    Environment = "${var.env_suffix}"
  }
}
resource "aws_security_group_rule" "allow_all_outbound_traffic" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.Security_Group_bastion.id
}
