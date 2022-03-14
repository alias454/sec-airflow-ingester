## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_mwaa_environment.infosec_airflow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mwaa_environment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airflow_environment_class"></a> [airflow\_environment\_class](#input\_airflow\_environment\_class) | Environment class for Airflow. Options are mw1.small, mw1.medium, mw1.large | `string` | `"mw1.small"` | no |
| <a name="input_airflow_environment_name"></a> [airflow\_environment\_name](#input\_airflow\_environment\_name) | Name of the Airflow environment to use | `string` | `null` | no |
| <a name="input_config_core_default_task_retries"></a> [config\_core\_default\_task\_retries](#input\_config\_core\_default\_task\_retries) | Number of times to retry a task | `number` | `10` | no |
| <a name="input_config_core_lazy_load_plugins"></a> [config\_core\_lazy\_load\_plugins](#input\_config\_core\_lazy\_load\_plugins) | Plugins are loaded when required(lazily) or on every module execution. Default is True | `string` | `"False"` | no |
| <a name="input_config_core_parallelism"></a> [config\_core\_parallelism](#input\_config\_core\_parallelism) | Number of tasks that can be run simultaneously | `number` | `3` | no |
| <a name="input_config_core_pause_dags_at_creation"></a> [config\_core\_pause\_dags\_at\_creation](#input\_config\_core\_pause\_dags\_at\_creation) | Pause DAGS when created(true) or run immediately(false) | `string` | `"False"` | no |
| <a name="input_config_webserver_navbar_color"></a> [config\_webserver\_navbar\_color](#input\_config\_webserver\_navbar\_color) | Set navbar color. Default is #fff | `string` | `"#f0fff0"` | no |
| <a name="input_config_webserver_reload_on_plugin_change"></a> [config\_webserver\_reload\_on\_plugin\_change](#input\_config\_webserver\_reload\_on\_plugin\_change) | Reload plugins in the webserver when updated | `string` | `"True"` | no |
| <a name="input_dag_processing_logs_enabled"></a> [dag\_processing\_logs\_enabled](#input\_dag\_processing\_logs\_enabled) | DAG processing logs enabled. values: true or false | `bool` | `true` | no |
| <a name="input_dag_processing_logs_level"></a> [dag\_processing\_logs\_level](#input\_dag\_processing\_logs\_level) | DAG processing logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default | `string` | `"WARNING"` | no |
| <a name="input_dag_s3_path"></a> [dag\_s3\_path](#input\_dag\_s3\_path) | Relative path for DAGS directory | `string` | `"dags/"` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | Execution role ARN for Amazon MWAA | `string` | `null` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | Set to the ARN of the managed KMS key aws/airflow by default | `string` | `null` | no |
| <a name="input_max_workers"></a> [max\_workers](#input\_max\_workers) | Max number of workers that can be automatically scaled up | `number` | `10` | no |
| <a name="input_min_workers"></a> [min\_workers](#input\_min\_workers) | Min number of workers to keep on standby | `number` | `1` | no |
| <a name="input_plugins_object_version"></a> [plugins\_object\_version](#input\_plugins\_object\_version) | S3 object version ID for plugins.zip | `string` | `null` | no |
| <a name="input_plugins_s3_path"></a> [plugins\_s3\_path](#input\_plugins\_s3\_path) | Path for plugins.zip | `string` | `"plugins.zip"` | no |
| <a name="input_requirements_object_version"></a> [requirements\_object\_version](#input\_requirements\_object\_version) | S3 object version ID for requirements.txt | `string` | `null` | no |
| <a name="input_requirements_s3_path"></a> [requirements\_s3\_path](#input\_requirements\_s3\_path) | Relative path for requirements file | `string` | `"requirements.txt"` | no |
| <a name="input_schedule_logs_enabled"></a> [schedule\_logs\_enabled](#input\_schedule\_logs\_enabled) | Schedule logs enabled. values: true or false | `bool` | `true` | no |
| <a name="input_schedule_logs_level"></a> [schedule\_logs\_level](#input\_schedule\_logs\_level) | Schedule logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default | `string` | `"WARNING"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | SG IDs for Airflow. Needs to allow resources to talk to each other, otherwise MWAA cannot be provisioned | `string` | `null` | no |
| <a name="input_source_bucket_arn"></a> [source\_bucket\_arn](#input\_source\_bucket\_arn) | Source s3 bucket ARN | `string` | `null` | no |
| <a name="input_subnet_id_list"></a> [subnet\_id\_list](#input\_subnet\_id\_list) | Private subnet list used for provisioning an Airflow environment, requires 2 subnets | `list(string)` | `null` | no |
| <a name="input_task_logs_enabled"></a> [task\_logs\_enabled](#input\_task\_logs\_enabled) | Task logs enabled. values: true or false | `bool` | `true` | no |
| <a name="input_task_logs_level"></a> [task\_logs\_level](#input\_task\_logs\_level) | Task Logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default | `string` | `"INFO"` | no |
| <a name="input_webserver_access_mode"></a> [webserver\_access\_mode](#input\_webserver\_access\_mode) | Webserver access mode option are PRIVATE\_ONLY (default) or PUBLIC\_ONLY | `string` | `"PUBLIC_ONLY"` | no |
| <a name="input_webserver_logs_enabled"></a> [webserver\_logs\_enabled](#input\_webserver\_logs\_enabled) | Webserver logs enabled. values: true or false | `bool` | `true` | no |
| <a name="input_webserver_logs_level"></a> [webserver\_logs\_level](#input\_webserver\_logs\_level) | Webserver logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default | `string` | `"WARNING"` | no |
| <a name="input_weekly_maintenance_window_start"></a> [weekly\_maintenance\_window\_start](#input\_weekly\_maintenance\_window\_start) | Weekly maintenance start time value | `string` | `"SUN:17:30"` | no |
| <a name="input_worker_logs_enabled"></a> [worker\_logs\_enabled](#input\_worker\_logs\_enabled) | Worker logs enabled. values: true or false | `bool` | `true` | no |
| <a name="input_worker_logs_level"></a> [worker\_logs\_level](#input\_worker\_logs\_level) | Worker logs logging level. values: CRITICAL, ERROR, WARNING, INFO, DEBUG. INFO by default | `string` | `"WARNING"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The Created At date of the MWAA Environment |
| <a name="output_log_group_arns"></a> [log\_group\_arns](#output\_log\_group\_arns) | Cloudwatch ARNS for log groups as type = dict |
| <a name="output_status"></a> [status](#output\_status) | The status of the Amazon MWAA Environment |
| <a name="output_webserver_url"></a> [webserver\_url](#output\_webserver\_url) | Webserver URL of the MWAA environment as type = string |
