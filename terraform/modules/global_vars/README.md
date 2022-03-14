## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airflow_app_policy_path"></a> [airflow\_app\_policy\_path](#input\_airflow\_app\_policy\_path) | Airflow app policy path on local filesystem | `string` | `"../airflow-iam-policy.tpl"` | no |
| <a name="input_airflow_dags_s3_bucket_name"></a> [airflow\_dags\_s3\_bucket\_name](#input\_airflow\_dags\_s3\_bucket\_name) | Bucket where airflow DAGS, plugins, and requirements.txt are loaded from | `map(string)` | <pre>{<br>  "dev": null,<br>  "prod": null<br>}</pre> | no |
| <a name="input_airflow_environment_name"></a> [airflow\_environment\_name](#input\_airflow\_environment\_name) | Define the Airflow environment name | `string` | `null` | no |
| <a name="input_airflow_iam_description"></a> [airflow\_iam\_description](#input\_airflow\_iam\_description) | Description of the IAM role | `string` | `"Airflow execution role"` | no |
| <a name="input_airflow_iam_name"></a> [airflow\_iam\_name](#input\_airflow\_iam\_name) | Name of the IAM role to create | `map(string)` | <pre>{<br>  "dev": "airflow-iam-policy-dev",<br>  "prod": "airflow-iam-policy-prod"<br>}</pre> | no |
| <a name="input_airflow_principal_identifiers"></a> [airflow\_principal\_identifiers](#input\_airflow\_principal\_identifiers) | Value for sts assume role principals | `list(string)` | <pre>[<br>  "airflow.amazonaws.com",<br>  "airflow-env.amazonaws.com"<br>]</pre> | no |
| <a name="input_airflow_security_group_description"></a> [airflow\_security\_group\_description](#input\_airflow\_security\_group\_description) | Description of the Airflow security group | `string` | `"Security Group for Amazon MWAA Environment"` | no |
| <a name="input_airflow_security_group_name"></a> [airflow\_security\_group\_name](#input\_airflow\_security\_group\_name) | Name of the Airflow security group | `map(string)` | <pre>{<br>  "dev": "airflow-security-group-dev",<br>  "prod": "airflow-security-group-prod"<br>}</pre> | no |
| <a name="input_airflow_subnet_id_list"></a> [airflow\_subnet\_id\_list](#input\_airflow\_subnet\_id\_list) | Default AWS subnet IDs to use for airflow | `map(list(string))` | <pre>{<br>  "dev": [],<br>  "prod": []<br>}</pre> | no |
| <a name="input_airflow_vpc_name"></a> [airflow\_vpc\_name](#input\_airflow\_vpc\_name) | Default AWS VPC name to use for airflow | `map(string)` | <pre>{<br>  "dev": null,<br>  "prod": null<br>}</pre> | no |
| <a name="input_data_service_tag"></a> [data\_service\_tag](#input\_data\_service\_tag) | Override default service tag for data buckets and queues | `string` | `null` | no |
| <a name="input_environment_tag"></a> [environment\_tag](#input\_environment\_tag) | Default environment tag | `map(string)` | <pre>{<br>  "dev": "development",<br>  "prod": "production"<br>}</pre> | no |
| <a name="input_logstream_app_policy_path"></a> [logstream\_app\_policy\_path](#input\_logstream\_app\_policy\_path) | Cloudwatch to Kinesis app policy path on local filesystem | `string` | `"../airflow-logstream-iam-policy.tpl"` | no |
| <a name="input_logstream_iam_description"></a> [logstream\_iam\_description](#input\_logstream\_iam\_description) | Description of the logstream IAM role | `string` | `"Allow sending Cloudwatch logs to Kinesis data streams"` | no |
| <a name="input_logstream_iam_name"></a> [logstream\_iam\_name](#input\_logstream\_iam\_name) | Name of the IAM role to create allowing Cloudwatch to Kinesis log streams | `string` | `"airflow-logstream-iam-policy"` | no |
| <a name="input_logstream_principal_identifiers"></a> [logstream\_principal\_identifiers](#input\_logstream\_principal\_identifiers) | Cloudwatch sts assume role principals | `list(string)` | <pre>[<br>  "delivery.logs.amazonaws.com",<br>  "logs.amazonaws.com"<br>]</pre> | no |
| <a name="input_product_tag"></a> [product\_tag](#input\_product\_tag) | Default product tag | `string` | `"security"` | no |
| <a name="input_region"></a> [region](#input\_region) | Default region for the AWS provider | `map(string)` | <pre>{<br>  "dev": "us-east-1",<br>  "prod": "us-west-2"<br>}</pre> | no |
| <a name="input_s3_bucket_names"></a> [s3\_bucket\_names](#input\_s3\_bucket\_names) | List of bucket names to be used as DAG outputs | `map(list(string))` | <pre>{<br>  "dev": [],<br>  "prod": []<br>}</pre> | no |
| <a name="input_service_tag"></a> [service\_tag](#input\_service\_tag) | Default service tag | `string` | `"airflow"` | no |
| <a name="input_ssm_parameter_path"></a> [ssm\_parameter\_path](#input\_ssm\_parameter\_path) | SSM parameter store root path for reading secrets | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Define the lifecycle stage. dev or prod as examples | `string` | n/a | yes |
| <a name="input_team_tag"></a> [team\_tag](#input\_team\_tag) | Default team tag | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Value of current account ID |
| <a name="output_airflow_dags_s3_bucket_name"></a> [airflow\_dags\_s3\_bucket\_name](#output\_airflow\_dags\_s3\_bucket\_name) | Value from airflow\_dags\_s3\_bucket\_name as type = string |
| <a name="output_airflow_environment_name"></a> [airflow\_environment\_name](#output\_airflow\_environment\_name) | Value from airflow\_environment\_name as type = string |
| <a name="output_airflow_iam_description"></a> [airflow\_iam\_description](#output\_airflow\_iam\_description) | Value from airflow\_iam\_description as type = string |
| <a name="output_airflow_iam_name"></a> [airflow\_iam\_name](#output\_airflow\_iam\_name) | Value from airflow\_iam\_name as type = string |
| <a name="output_airflow_principal_identifiers"></a> [airflow\_principal\_identifiers](#output\_airflow\_principal\_identifiers) | Value for sts assume role principals as type = list |
| <a name="output_airflow_rendered_app_policy"></a> [airflow\_rendered\_app\_policy](#output\_airflow\_rendered\_app\_policy) | Value from airflow\_app\_policy\_path as rendered template |
| <a name="output_airflow_security_group_description"></a> [airflow\_security\_group\_description](#output\_airflow\_security\_group\_description) | Description of the Airflow security group |
| <a name="output_airflow_security_group_name"></a> [airflow\_security\_group\_name](#output\_airflow\_security\_group\_name) | Name of the Airflow security group |
| <a name="output_airflow_subnet_id_list"></a> [airflow\_subnet\_id\_list](#output\_airflow\_subnet\_id\_list) | Value from airflow\_subnet\_id\_list as type = list |
| <a name="output_airflow_vpc_name"></a> [airflow\_vpc\_name](#output\_airflow\_vpc\_name) | Value from airflow\_vpc map as type = string |
| <a name="output_caller_arn"></a> [caller\_arn](#output\_caller\_arn) | Value of current user ARN |
| <a name="output_caller_user"></a> [caller\_user](#output\_caller\_user) | Value of current user ID |
| <a name="output_data_service_tag"></a> [data\_service\_tag](#output\_data\_service\_tag) | Value from data\_service\_tag as type = string |
| <a name="output_environment_tag"></a> [environment\_tag](#output\_environment\_tag) | Value from environment\_tag map as type = string |
| <a name="output_logstream_iam_description"></a> [logstream\_iam\_description](#output\_logstream\_iam\_description) | Value from logstream\_iam\_description as type = string |
| <a name="output_logstream_iam_name"></a> [logstream\_iam\_name](#output\_logstream\_iam\_name) | Value from logstream\_iam\_name as type = string |
| <a name="output_logstream_principal_identifiers"></a> [logstream\_principal\_identifiers](#output\_logstream\_principal\_identifiers) | Value for sts assume role principals as type = list |
| <a name="output_logstream_rendered_app_policy"></a> [logstream\_rendered\_app\_policy](#output\_logstream\_rendered\_app\_policy) | Value from logstream\_app\_policy\_path as rendered template |
| <a name="output_product_tag"></a> [product\_tag](#output\_product\_tag) | Value from product\_tag as type = string |
| <a name="output_region"></a> [region](#output\_region) | Value from region map as type = string |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | Value from s3\_bucket\_name as type = string |
| <a name="output_service_tag"></a> [service\_tag](#output\_service\_tag) | Value from service\_tag as type = string |
| <a name="output_team_tag"></a> [team\_tag](#output\_team\_tag) | Value from team\_tag as type = string |
