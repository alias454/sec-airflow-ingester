# Kinesis stream to write cloudwatch logs to
resource "aws_kinesis_stream" "kinesis_log_stream" {
  for_each = { for k, v in var.log_groups[0] : k => v if var.create }
  name     = "${element(split(":", each.value[0].cloud_watch_log_group_arn), 6)}-logstream"

  shard_count      = var.shard_count
  retention_period = var.retention_period_in_hours

  stream_mode_details {
    stream_mode = var.stream_mode
  }
}

# Setup Kinesis subscriptions to Cloudwatch log groups
resource "aws_cloudwatch_log_subscription_filter" "kinesis_subscription" {
  for_each        = { for k, v in var.log_groups[0] : k => v if var.create }
  name            = "${element(split(":", each.value[0].cloud_watch_log_group_arn), 6)}-logstream"
  role_arn        = var.iam_role_arn
  destination_arn = aws_kinesis_stream.kinesis_log_stream[each.key].arn
  log_group_name  = element(split(":", each.value[0].cloud_watch_log_group_arn), 6)
  filter_pattern  = var.filter_pattern
  distribution    = var.distribution
}