## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.74 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_airflow_mwaa_module"></a> [airflow\_mwaa\_module](#module\_airflow\_mwaa\_module) | ../modules/airflow_mwaa_module | n/a |
| <a name="module_airflow_s3bucket_module"></a> [airflow\_s3bucket\_module](#module\_airflow\_s3bucket\_module) | ../modules/airflow_dags_s3_bucket | n/a |
| <a name="module_global_vars_module"></a> [global\_vars\_module](#module\_global\_vars\_module) | ../modules/global_vars | n/a |
| <a name="module_iam_role_module"></a> [iam\_role\_module](#module\_iam\_role\_module) | ../modules/airflow_iam_role | n/a |
| <a name="module_logstream_iam_role_module"></a> [logstream\_iam\_role\_module](#module\_logstream\_iam\_role\_module) | ../modules/airflow_iam_role | n/a |
| <a name="module_logstream_to_kinesis_module"></a> [logstream\_to\_kinesis\_module](#module\_logstream\_to\_kinesis\_module) | ../modules/airflow_logstream_to_kinesis | n/a |
| <a name="module_s3bucket_module"></a> [s3bucket\_module](#module\_s3bucket\_module) | ../modules/airflow_s3_bucket | n/a |
| <a name="module_security_groups_module"></a> [security\_groups\_module](#module\_security\_groups\_module) | ../modules/airflow_security_groups | n/a |
| <a name="module_sqs_module"></a> [sqs\_module](#module\_sqs\_module) | ../modules/airflow_sqs_queue | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_stage"></a> [stage](#input\_stage) | Define the lifecycle stage. dev or prod as examples | `string` | `"prod"` | no |

## Outputs

No outputs.
