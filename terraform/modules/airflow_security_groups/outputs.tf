# Output values
output "vpc_name" {
  value       = var.vpc_name
  description = "Name of the VPC as type = string"
}

output "vpc_id" {
  value       = data.aws_vpc.selected_vpc.id
  description = "ID of the VPC as type = string"
}

output "security_group_id" {
  value       = aws_security_group.security_group.id
  description = "ID of the security group as type = string"
}
