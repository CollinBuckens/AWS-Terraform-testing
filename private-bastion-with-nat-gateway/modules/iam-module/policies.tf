resource "aws_iam_policy_attachment" "ssm_managed_instance_core" {
  name       = "ssm-managed-policy"
  roles      = [resource.aws_iam_role.bastion_role.id]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy_attachment" "EC2_role_for_ssm" {
  name       = "ssm-role-policy"
  roles      = [resource.aws_iam_role.bastion_role.id]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}