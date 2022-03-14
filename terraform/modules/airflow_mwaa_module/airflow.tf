# Setup for Apache Airflow managed by AWS
resource "aws_mwaa_environment" "infosec_airflow" {
  name               = var.airflow_environment_name
  execution_role_arn = var.execution_role_arn
  environment_class  = var.airflow_environment_class

  max_workers = var.max_workers
  min_workers = var.min_workers

  source_bucket_arn = var.source_bucket_arn

  dag_s3_path                    = var.dag_s3_path
  plugins_s3_path                = var.plugins_s3_path
  plugins_s3_object_version      = var.plugins_object_version
  requirements_s3_path           = var.requirements_s3_path
  requirements_s3_object_version = var.requirements_object_version

  kms_key = var.kms_key

  network_configuration {
    security_group_ids = [var.security_group_ids]
    subnet_ids         = var.subnet_id_list
  }

  webserver_access_mode = var.webserver_access_mode

  weekly_maintenance_window_start = var.weekly_maintenance_window_start

  airflow_configuration_options = {
    "core.dags_are_paused_at_creation"  = var.config_core_pause_dags_at_creation
    "core.lazy_load_plugins"            = var.config_core_lazy_load_plugins
    "core.default_task_retries"         = var.config_core_default_task_retries
    "core.parallelism"                  = var.config_core_parallelism
    "webserver.reload_on_plugin_change" = var.config_webserver_reload_on_plugin_change
    "webserver.navbar_color"            = var.config_webserver_navbar_color
  }

  logging_configuration {
    task_logs {
      enabled   = var.task_logs_enabled
      log_level = var.task_logs_level
    }

    dag_processing_logs {
      enabled   = var.dag_processing_logs_enabled
      log_level = var.dag_processing_logs_level
    }

    scheduler_logs {
      enabled   = var.schedule_logs_enabled
      log_level = var.schedule_logs_level
    }

    webserver_logs {
      enabled   = var.webserver_logs_enabled
      log_level = var.webserver_logs_level
    }

    worker_logs {
      enabled   = var.worker_logs_enabled
      log_level = var.worker_logs_level
    }
  }

  tags = {
    Name = var.airflow_environment_name
  }
}
