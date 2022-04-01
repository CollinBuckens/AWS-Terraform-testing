output "security_group_bastion_id" {
  description = "The id of the security group for the bastion"
  value       = try(aws_security_group.Security_Group_bastion.id, "")
}