#outputs iam module.
output "profile_name" {
  description = "The name of the instance profile."
  value       = resource.aws_iam_instance_profile.jenkins_host_profile.name
}