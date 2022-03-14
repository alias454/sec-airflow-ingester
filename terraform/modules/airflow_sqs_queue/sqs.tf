# Create SQS queue for log retrieval
resource "aws_sqs_queue" "sqs_queue_deadletter_queue" {
  count = var.create ? length(var.queue_name) : 0
  name  = "${var.queue_name[count.index]}-deadletter"

  tags = {
    Name    = "${var.queue_name[count.index]}-deadletter"
    service = var.service_tag
  }
}

resource "aws_sqs_queue" "sqs_queue" {
  count                      = var.create ? length(var.queue_name) : 0
  name                       = "${var.queue_name[count.index]}-queue"
  visibility_timeout_seconds = var.visibility_timeout_seconds

  # kms_master_key_id                 = "alias/aws/sqs"
  # kms_data_key_reuse_period_seconds = 300

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_queue_deadletter_queue[count.index].arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = {
    Name    = "${var.queue_name[count.index]}-queue"
    service = var.service_tag
  }
}

# Create SQS policy for queue
resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  count     = var.create ? length(var.queue_name) : 0
  queue_url = aws_sqs_queue.sqs_queue[count.index].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sqs:SendMessage",
        Effect    = "Allow",
        Resource  = aws_sqs_queue.sqs_queue[count.index].arn,
        Principal = "*",
        Condition = {
          ArnEquals = {
            "aws:SourceArn" : var.bucket_arn[count.index]
          }
        }
      }
    ]
  })
}

# Get events when an s3 data object is created
resource "aws_s3_bucket_notification" "bucket_notification" {
  count  = var.create ? length(var.queue_name) : 0
  bucket = var.bucket_id[count.index]

  queue {
    queue_arn = aws_sqs_queue.sqs_queue[count.index].arn
    events    = ["s3:ObjectCreated:*"]
  }
}
