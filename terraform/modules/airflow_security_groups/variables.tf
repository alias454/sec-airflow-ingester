# Set default variables for the terraform module
variable "vpc_name" {
  description = "Name of the VPC to use"
  type        = string
  default     = null
}

variable "security_group_name" {
  description = "Name of the security group to manage"
  type        = string
  default     = null
}

variable "security_group_description" {
  description = "Description of the security group to manage"
  type        = string
  default     = null
}
