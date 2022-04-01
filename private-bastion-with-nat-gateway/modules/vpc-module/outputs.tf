# enter the outputs here
output "aws_vpc_id" {
  description = "The id of the gateway VPC"
  value       = module.aws_vpc.vpc_id
}

output "aws_vpc_cidr" {
  description = "The cidr block of the gateway VPC"
  value       = module.aws_vpc.vpc_cidr_block
}

output "aws_vpc_cidr_ipv6" {
  description = "The ipv6 cidr block of the gateway VPC"
  value       = module.aws_vpc.vpc_ipv6_cidr_block
}

output "aws_vpc_public_subnet" {
  description = "The public subnet of the VPC"
  value       = module.aws_vpc.public_subnets
}

output "aws_vpc_private_subnet" {
  description = "The private subnet of the VPC"
  value       = module.aws_vpc.private_subnets
}