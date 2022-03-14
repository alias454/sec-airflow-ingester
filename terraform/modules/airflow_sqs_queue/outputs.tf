# Output values
output "sqs_queue_name" {
  value       = join(",", aws_sqs_queue.sqs_queue[*].name)
  description = "SQS queue name"
}

output "sqs_queue_arn" {
  value       = join(",", aws_sqs_queue.sqs_queue[*].arn)
  description = "SQS queue arn"
}