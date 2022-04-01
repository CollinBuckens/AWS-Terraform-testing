output "profile_name" {
  description = "The name of the instance profile."
  value       = resource.aws_iam_instance_profile.bastion_profile.name
}
