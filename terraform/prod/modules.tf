# Get the default values for app settings
module "global_vars_module" {
  source = "../modules/global_vars"

  # Pass in the proper stage to get output info
  stage                       = var.stage
  team_tag                    = local.team_tag
  airflow_vpc_name            = local.airflow_vpc_name
  airflow_subnet_id_list      = local.airflow_subnet_id_list
  airflow_environment_name    = local.airflow_environment_name
  airflow_dags_s3_bucket_name = local.airflow_dags_s3_bucket_name
  s3_bucket_names             = local.s3_bucket_names
  data_service_tag            = local.data_service_tag
  ssm_parameter_path          = local.ssm_parameter_path
}

# Include terraform modules for app build
module "security_groups_module" {
  source = "../modules/airflow_security_groups"

  # Module variables for configuration
  vpc_name                   = module.global_vars_module.airflow_vpc_name
  security_group_name        = module.global_vars_module.airflow_security_group_name
  security_group_description = module.global_vars_module.airflow_security_group_description
}

module "iam_role_module" {
  source = "../modules/airflow_iam_role"

  # Module variables for configuration
  description     = module.global_vars_module.airflow_iam_description
  iam_name        = module.global_vars_module.airflow_iam_name
  role_principals = module.global_vars_module.airflow_principal_identifiers
  app_policy_data = module.global_vars_module.airflow_rendered_app_policy
}

module "airflow_s3bucket_module" {
  source = "../modules/airflow_dags_s3_bucket"

  # Module variables for configuration
  bucket_name = module.global_vars_module.airflow_dags_s3_bucket_name
}

module "airflow_mwaa_module" {
  source = "../modules/airflow_mwaa_module"

  # Module variables for configuration
  airflow_environment_name    = module.global_vars_module.airflow_environment_name
  subnet_id_list              = module.global_vars_module.airflow_subnet_id_list
  execution_role_arn          = module.iam_role_module.iam_role_arn
  security_group_ids          = module.security_groups_module.security_group_id
  source_bucket_arn           = module.airflow_s3bucket_module.dags_bucket_arn
  plugins_object_version      = module.airflow_s3bucket_module.plugins_zip_object_version
  requirements_object_version = module.airflow_s3bucket_module.requirements_txt_object_version

  depends_on = [
    module.iam_role_module,
    module.airflow_s3bucket_module,
    module.security_groups_module
  ]
}

module "s3bucket_module" {
  source = "../modules/airflow_s3_bucket"

  # Module variables for configuration
  bucket_name = module.global_vars_module.s3_bucket_name
  service_tag = module.global_vars_module.data_service_tag
}

# Enable SQS queues for each Airflow DAG output bucket
module "sqs_module" {
  source = "../modules/airflow_sqs_queue"

  # Module variables for configuration
  create      = local.sqs.create # true/false to create resources or not
  service_tag = module.global_vars_module.data_service_tag
  queue_name  = module.s3bucket_module.bucket_name_list
  bucket_arn  = module.s3bucket_module.bucket_arn_list
  bucket_id   = module.s3bucket_module.bucket_id_list
}

# Enable Kinesis subscriptions to Cloudwatch logs generated by Apache Airflow
module "logstream_iam_role_module" {
  source = "../modules/airflow_iam_role"

  # Module variables for configuration
  create          = local.logstream.create # true/false to create resources or not
  description     = module.global_vars_module.logstream_iam_description
  iam_name        = module.global_vars_module.logstream_iam_name
  role_principals = module.global_vars_module.logstream_principal_identifiers
  app_policy_data = module.global_vars_module.logstream_rendered_app_policy
}

module "logstream_to_kinesis_module" {
  source = "../modules/airflow_logstream_to_kinesis"

  # Module variables for configuration
  create       = local.logstream.create # true/false to create resources or not
  log_groups   = module.airflow_mwaa_module.log_group_arns
  iam_role_arn = module.logstream_iam_role_module.iam_role_arn
}
