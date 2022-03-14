# Set default variables for the terraform module
variable "create" {
  description = "Create Kinesis subscription if true"
  type        = bool
  default     = false
}

variable "iam_role_arn" {
  description = "ARN of the IAM role to use"
  type        = string
  default     = null
}

variable "log_groups" {
  description = "List of log group dicts to subscribe to"
  type        = list(any)
  default     = null
}

variable "shard_count" {
  description = "Number of shards to provision. Value MUST be set if using PROVISIONED stream_mode"
  type        = string
  default     = null
}

variable "retention_period_in_hours" {
  description = "Event retention in hours. 168 is 7 days"
  type        = number
  default     = 168
}

variable "stream_mode" {
  description = "Stream mode either ON_DEMAND or PROVISIONED. If PROVISIONED then MUST set shard_count"
  type        = string
  default     = "ON_DEMAND"
}

variable "distribution" {
  description = "Method used to distribute log data to the destination. Random or ByLogStream are valid options"
  type        = string
  default     = "ByLogStream"
}

variable "filter_pattern" {
  description = "Valid CloudWatch filter pattern for subscribing to a stream of log events"
  type        = string
  default     = ""
}