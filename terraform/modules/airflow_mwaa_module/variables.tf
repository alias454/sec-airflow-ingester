# Set default variables for the terraform module
variable "airflow_environment_name" {
  description = "Name of the Airflow environment to use"
  type        = string
  default     = null
}

variable "execution_role_arn" {
  description = "Execution role ARN for Amazon MWAA"
  type        = string
  default     = null
}

variable "airflow_environment_class" {
  description = "Environment class for Airflow. Options are mw1.small, mw1.medium, mw1.large"
  type        = string
  default     = "mw1.small"
}

variable "max_workers" {
  description = "Max number of workers that can be automatically scaled up"
  type        = number
  default     = 10
}

variable "min_workers" {
  description = "Min number of workers to keep on standby"
  type        = number
  default     = 1
}

variable "source_bucket_arn" {
  description = "Source s3 bucket ARN"
  type        = string
  default     = null
}

variable "dag_s3_path" {
  description = "Relative path for DAGS directory"
  type        = string
  default     = "dags/"
}

variable "plugins_s3_path" {
  description = "Path for plugins.zip"
  type        = string
  default     = "plugins.zip"
}

variable "plugins_object_version" {
  description = "S3 object version ID for plugins.zip"
  type        = string
  default     = null
}

variable "requirements_s3_path" {
  description = "Relative path for requirements file"
  type        = string
  default     = "requirements.txt"
}

variable "requirements_object_version" {
  description = "S3 object version ID for requirements.txt"
  type        = string
  default     = null
}

variable "kms_key" {
  description = "Set to the ARN of the managed KMS key aws/airflow by default"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "SG IDs for Airflow. Needs to allow resources to talk to each other, otherwise MWAA cannot be provisioned"
  type        = string
  default     = null
}

variable "subnet_id_list" {
  description = "Private subnet list used for provisioning an Airflow environment, requires 2 subnets"
  type        = list(string)
  default     = null
}

variable "webserver_access_mode" {
  description = "Webserver access mode option are PRIVATE_ONLY (default) or PUBLIC_ONLY"
  type        = string
  default     = "PUBLIC_ONLY"
}

variable "weekly_maintenance_window_start" {
  description = "Weekly maintenance start time value"
  type        = string
  default     = "SUN:17:30"
}

variable "config_core_pause_dags_at_creation" {
  description = "Pause DAGS when created(true) or run immediately(false)"
  type        = string
  default     = "False"
}

variable "config_core_lazy_load_plugins" {
  description = "Plugins are loaded when required(lazily) or on every module execution. Default is True"
  type        = string
  default     = "False"
}

variable "config_core_default_task_retries" {
  description = "Number of times to retry a task"
  type        = number
  default     = 10
}

variable "config_core_parallelism" {
  description = "Number of tasks that can be run simultaneously"
  type        = number
  default     = 3
}

variable "config_webserver_reload_on_plugin_change" {
  description = "Reload plugins in the webserver when updated"
  type        = string
  default     = "True"
}

variable "config_webserver_navbar_color" {
  description = "Set navbar color. Default is #fff"
  type        = string
  default     = "#f0fff0"
}

variable "task_logs_enabled" {
  description = "Task logs enabled. values: true or false"
  type        = bool
  default     = true
}

variable "task_logs_level" {
  description = "Task Logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default"
  type        = string
  default     = "INFO"
}

variable "dag_processing_logs_enabled" {
  description = "DAG processing logs enabled. values: true or false"
  type        = bool
  default     = true
}

variable "dag_processing_logs_level" {
  description = "DAG processing logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default"
  type        = string
  default     = "WARNING"
}

variable "schedule_logs_enabled" {
  description = "Schedule logs enabled. values: true or false"
  type        = bool
  default     = true
}

variable "schedule_logs_level" {
  description = "Schedule logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default"
  type        = string
  default     = "WARNING"
}

variable "webserver_logs_enabled" {
  description = "Webserver logs enabled. values: true or false"
  type        = bool
  default     = true
}

variable "webserver_logs_level" {
  description = "Webserver logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default"
  type        = string
  default     = "WARNING"
}

variable "worker_logs_enabled" {
  description = "Worker logs enabled. values: true or false"
  type        = bool
  default     = true
}

variable "worker_logs_level" {
  description = "Worker logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default"
  type        = string
  default     = "WARNING"
}
