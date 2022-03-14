# Get access to Account ID, User ID, and ARN from current AWS provider
data "aws_caller_identity" "current" {}

# Set default variables for the terraform configuration
variable "stage" {
  description = "Define the lifecycle stage. dev or prod as examples"
  type        = string
}

variable "region" {
  description = "Default region for the AWS provider"
  type        = map(string)
  default = {
    "dev"  = "us-east-1"
    "prod" = "us-west-2"
  }
}

variable "environment_tag" {
  description = "Default environment tag"
  type        = map(string)
  default = {
    "dev"  = "development"
    "prod" = "production"
  }
}

variable "service_tag" {
  description = "Default service tag"
  type        = string
  default     = "airflow"
}

variable "product_tag" {
  description = "Default product tag"
  type        = string
  default     = "security"
}

variable "team_tag" {
  description = "Default team tag"
  type        = string
  default     = null
}

variable "airflow_environment_name" {
  description = "Define the Airflow environment name"
  type        = string
  default     = null
}

variable "airflow_vpc_name" {
  description = "Default AWS VPC name to use for airflow"
  type        = map(string)
  default = {
    "dev"  = null
    "prod" = null
  }
}

variable "airflow_subnet_id_list" {
  description = "Default AWS subnet IDs to use for airflow"
  type        = map(list(string))
  default = {
    "dev"  = []
    "prod" = []
  }
}

variable "airflow_security_group_name" {
  description = "Name of the Airflow security group"
  type        = map(string)
  default = {
    "dev"  = "airflow-security-group-dev"
    "prod" = "airflow-security-group-prod"
  }
}

variable "airflow_security_group_description" {
  description = "Description of the Airflow security group"
  type        = string
  default     = "Security Group for Amazon MWAA Environment"
}

variable "airflow_iam_name" {
  description = "Name of the IAM role to create"
  type        = map(string)
  default = {
    "dev"  = "airflow-iam-policy-dev"
    "prod" = "airflow-iam-policy-prod"
  }
}

variable "airflow_iam_description" {
  description = "Description of the IAM role"
  type        = string
  default     = "Airflow execution role"
}

variable "airflow_principal_identifiers" {
  description = "Value for sts assume role principals"
  type        = list(string)
  default = [
    "airflow.amazonaws.com",
    "airflow-env.amazonaws.com"
  ]
}

variable "airflow_app_policy_path" {
  description = "Airflow app policy path on local filesystem"
  type        = string
  default     = "../airflow-iam-policy.tpl"
}

variable "airflow_dags_s3_bucket_name" {
  description = "Bucket where airflow DAGS, plugins, and requirements.txt are loaded from"
  type        = map(string)
  default = {
    "dev"  = null
    "prod" = null
  }
}

variable "logstream_iam_name" {
  description = "Name of the IAM role to create allowing Cloudwatch to Kinesis log streams"
  type        = string
  default     = "airflow-logstream-iam-policy"
}

variable "logstream_iam_description" {
  description = "Description of the logstream IAM role"
  type        = string
  default     = "Allow sending Cloudwatch logs to Kinesis data streams"
}

variable "logstream_principal_identifiers" {
  description = "Cloudwatch sts assume role principals"
  type        = list(string)
  default = [
    "delivery.logs.amazonaws.com",
    "logs.amazonaws.com"
  ]
}

variable "logstream_app_policy_path" {
  description = "Cloudwatch to Kinesis app policy path on local filesystem"
  type        = string
  default     = "../airflow-logstream-iam-policy.tpl"
}

variable "ssm_parameter_path" {
  description = "SSM parameter store root path for reading secrets"
  type        = string
  default     = null
}

variable "data_service_tag" {
  description = "Override default service tag for data buckets and queues"
  type        = string
  default     = null
}

variable "s3_bucket_names" {
  description = "List of bucket names to be used as DAG outputs"
  type        = map(list(string))
  default = {
    "dev"  = []
    "prod" = []
  }
}