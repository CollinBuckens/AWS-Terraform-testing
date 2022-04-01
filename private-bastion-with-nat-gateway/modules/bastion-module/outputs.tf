output "bastion_id" {
  description = "The id of the bastion instance"
  value       = aws_instance.bastion.id
}