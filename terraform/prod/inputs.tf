# Set default variables for the terraform configuration
variable "stage" {
  description = "Define the lifecycle stage. dev or prod as examples"
  type        = string
  default     = "prod"
}