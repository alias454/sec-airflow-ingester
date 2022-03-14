# Output values
output "iam_role_arn" {
  value       = join(",", aws_iam_role.iam_role[*].arn)
  description = "IAM Role arn"
}
