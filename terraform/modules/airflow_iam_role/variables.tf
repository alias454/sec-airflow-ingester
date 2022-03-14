# Set default variables for the terraform module
variable "create" {
  description = "Create IAM role if true"
  type        = bool
  default     = true
}

variable "iam_name" {
  description = "Name of the IAM role to create"
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the IAM role"
  type        = string
  default     = null
}

variable "role_principals" {
  description = "Value for sts assume role principal identifiers"
  type        = list(string)
  default     = null
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = var.role_principals
    }
  }
}

variable "app_policy_data" {
  description = "AWS IAM policy data"
  type        = string
  default     = null
}

variable "allow_managed" {
  description = "Allow adding a managed policy"
  type        = bool
  default     = false
}

variable "managed_policy_arn" {
  description = "ARN of the managed policy to add"
  type        = string
  default     = null
}
