output "Jenkins-host-id" {
  description = "The id of the jenkins host"
  value       = module.ec2_instance.id
}