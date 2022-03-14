# Output values
output "kinesis_stream_name" {
  value       = { for k, v in aws_kinesis_stream.kinesis_log_stream : k => v.name }
  description = "Kinesis stream name"
}

output "kinesis_stream_arn" {
  value       = { for k, v in aws_kinesis_stream.kinesis_log_stream : k => v.arn }
  description = "Kinesis stream ARN"
}