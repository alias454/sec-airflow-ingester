# Output values
output "account_id" {
  description = "Value of current account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  description = "Value of current user ARN"
  value       = data.aws_caller_identity.current.arn
}

output "caller_user" {
  description = "Value of current user ID"
  value       = data.aws_caller_identity.current.user_id
}

output "region" {
  description = "Value from region map as type = string"
  value       = lookup(var.region, var.stage)
}

output "environment_tag" {
  description = "Value from environment_tag map as type = string"
  value       = lookup(var.environment_tag, var.stage)
}

output "service_tag" {
  description = "Value from service_tag as type = string"
  value       = var.service_tag
}

output "product_tag" {
  description = "Value from product_tag as type = string"
  value       = var.product_tag
}

output "team_tag" {
  description = "Value from team_tag as type = string"
  value       = var.team_tag
}

output "airflow_environment_name" {
  description = "Value from airflow_environment_name as type = string"
  value       = var.airflow_environment_name
}

output "airflow_vpc_name" {
  description = "Value from airflow_vpc map as type = string"
  value       = lookup(var.airflow_vpc_name, var.stage)
}

output "airflow_subnet_id_list" {
  description = "Value from airflow_subnet_id_list as type = list"
  value       = lookup(var.airflow_subnet_id_list, var.stage)
}

output "airflow_security_group_name" {
  description = "Name of the Airflow security group"
  value       = lookup(var.airflow_security_group_name, var.stage)
}

output "airflow_security_group_description" {
  description = "Description of the Airflow security group"
  value       = var.airflow_security_group_description
}

output "airflow_iam_name" {
  description = "Value from airflow_iam_name as type = string"
  value       = lookup(var.airflow_iam_name, var.stage)
}

output "airflow_iam_description" {
  description = "Value from airflow_iam_description as type = string"
  value       = var.airflow_iam_description
}

output "airflow_principal_identifiers" {
  description = "Value for sts assume role principals as type = list"
  value       = var.airflow_principal_identifiers
}

output "airflow_rendered_app_policy" {
  description = "Value from airflow_app_policy_path as rendered template"
  value = templatefile(var.airflow_app_policy_path, {
    airflow_environment_name = var.airflow_environment_name,
    ssm_parameter_path       = var.ssm_parameter_path,
    account_id               = data.aws_caller_identity.current.account_id,
    region                   = lookup(var.region, var.stage),
    s3_bucket_names          = lookup(var.s3_bucket_names, var.stage),
    airflow_dags_bucket_name = lookup(var.airflow_dags_s3_bucket_name, var.stage)
  })
}

output "airflow_dags_s3_bucket_name" {
  description = "Value from airflow_dags_s3_bucket_name as type = string"
  value       = lookup(var.airflow_dags_s3_bucket_name, var.stage)
}

output "logstream_iam_name" {
  description = "Value from logstream_iam_name as type = string"
  value       = var.logstream_iam_name
}

output "logstream_iam_description" {
  description = "Value from logstream_iam_description as type = string"
  value       = var.logstream_iam_description
}

output "logstream_principal_identifiers" {
  description = "Value for sts assume role principals as type = list"
  value       = var.logstream_principal_identifiers
}

output "logstream_rendered_app_policy" {
  description = "Value from logstream_app_policy_path as rendered template"
  value = templatefile(var.logstream_app_policy_path, {
    airflow_environment_name = var.airflow_environment_name,
    account_id               = data.aws_caller_identity.current.account_id,
    region                   = lookup(var.region, var.stage)
  })
}

output "data_service_tag" {
  description = "Value from data_service_tag as type = string"
  value       = var.data_service_tag
}

output "s3_bucket_name" {
  description = "Value from s3_bucket_name as type = string"
  value       = lookup(var.s3_bucket_names, var.stage)
}
