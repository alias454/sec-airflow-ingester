# Output values
output "dags_bucket_name" {
  value       = aws_s3_bucket.dags_s3bucket.bucket
  description = "DAGS S3 Bucket Name"
}

output "dags_bucket_id" {
  value       = aws_s3_bucket.dags_s3bucket.id
  description = "DAGS S3 Bucket ID"
}

output "dags_bucket_arn" {
  value       = aws_s3_bucket.dags_s3bucket.arn
  description = "DAGS S3 Bucket ARN"
}

output "requirements_txt_object_version" {
  value       = aws_s3_bucket_object.s3_bucket_objects["requirements.txt"].version_id
  description = "S3 object version ID for requirements.txt"
}

output "plugins_zip_object_version" {
  value       = aws_s3_bucket_object.s3_bucket_objects["plugins.zip"].version_id
  description = "S3 object version ID for plugins.zip"
}