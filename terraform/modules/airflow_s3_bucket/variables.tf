# Set default variables for the terraform configuration
variable "create" {
  description = "Create s3 bucket if true"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Bucket name to be created"
  type        = list(string)
  default     = null
}

variable "service_tag" {
  description = "Tag value for service information"
  type        = string
  default     = null
}

variable "bucket_acl" {
  description = "Bucket acl can be private or public"
  type        = string
  default     = "private"
}

variable "enable_lifecycle_rules" {
  description = "Enable bucket lifecycle rules"
  type        = bool
  default     = true
}

variable "lifecycle_move_to_standard_ia" {
  description = "Days until data migrates to STANDARD_IA storage class"
  type        = number
  default     = 30
}

variable "lifecycle_move_to_glacier" {
  description = "Days until data migrates to GLACIER storage class"
  type        = number
  default     = 60
}

variable "lifecycle_expiration" {
  description = "Days to keep data before purging"
  type        = number
  default     = 90
}

variable "block_public_acls" {
  description = "Public block acls setting to enable blocking"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Public block policy setting to enable blocking"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Ignore public acls setting to enable blocking"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Restrict public buckets setting to enable blocking"
  type        = bool
  default     = true
}
