# Set default variables for the terraform configuration
variable "bucket_name" {
  description = "Bucket name to be created"
  type        = string
  default     = null
}

# Upload from local files dir to s3 bucket
variable "upload_file_path" {
  description = "Source file path for DAGs, plugins, and requirements.txt"
  type        = string
  default     = "../files"
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

variable "enable_bucket_versioning" {
  description = "Enable bucket versioning"
  type        = bool
  default     = true
}

variable "expire_noncurrent_versions_in_days" {
  description = "Source expiration in days for non-current file versions"
  type        = number
  default     = 7
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
