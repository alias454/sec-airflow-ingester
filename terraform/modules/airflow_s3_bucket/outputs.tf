# Output values
output "bucket_name_list" {
  value       = aws_s3_bucket.s3bucket[*].bucket
  description = "S3 Bucket Name as a list"
}

output "bucket_id_list" {
  value       = aws_s3_bucket.s3bucket[*].id
  description = "S3 Bucket ID as a list"
}

output "bucket_arn_list" {
  value       = aws_s3_bucket.s3bucket[*].arn
  description = "S3 Bucket ARN list"
}