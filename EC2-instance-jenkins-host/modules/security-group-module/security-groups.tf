#This is the configuration of the security group.
resource "aws_security_group" "Security_Group_jenkins" {
  name   = "security-group-jenkins"
  vpc_id = var.vpc_id
  tags = {
    Name = "security_group_jenkins_${var.env_suffix}"
  }
}
resource "aws_security_group_rule" "allow_jenkins_traffic" {
  type              = "ingress"
  to_port           = 8080
  from_port         = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.Security_Group_jenkins.id
}
resource "aws_security_group_rule" "allow_all_outbound_traffic" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.Security_Group_jenkins.id
}