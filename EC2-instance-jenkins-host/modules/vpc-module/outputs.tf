#put the outputs for the vpc here.
output "vpc_id" {
  description = "The id of the gateway VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The cidr block of the gateway VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_cidr_ipv6" {
  description = "The ipv6 cidr block of the gateway VPC"
  value       = module.vpc.vpc_ipv6_cidr_block
}

output "vpc_public_subnet" {
  description = "The public subnet of the VPC"
  value       = module.vpc.public_subnets
}

output "vpc_private_subnet" {
  description = "The private subnet of the VPC"
  value       = module.vpc.private_subnets
}