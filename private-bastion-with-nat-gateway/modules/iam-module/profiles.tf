resource "aws_iam_instance_profile" "bastion_profile" {
  name = "bastion_profile"
  role = resource.aws_iam_role.bastion_role.name
}