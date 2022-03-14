# Set default variables for the terraform module
variable "create" {
  description = "Create SQS queue if true"
  type        = bool
  default     = false
}

variable "service_tag" {
  description = "Tag value for service information"
  type        = string
  default     = "sec-data"
}

variable "queue_name" {
  description = "Name of the SQS queue to create"
  type        = list(string)
  default     = null
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for the queue"
  type        = number
  default     = 300
}

variable "max_receive_count" {
  description = "Times a consumer tries getting a message without deleting it before it moves to the DLQ"
  type        = number
  default     = 4
}

variable "bucket_id" {
  description = "Bucket id for queue notifications"
  type        = list(string)
  default     = null
}

variable "bucket_arn" {
  description = "Bucket arn for queue policy"
  type        = list(string)
  default     = null
}