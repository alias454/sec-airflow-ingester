## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_subscription_filter.kinesis_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_subscription_filter) | resource |
| [aws_kinesis_stream.kinesis_log_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Create Kinesis subscription if true | `bool` | `false` | no |
| <a name="input_distribution"></a> [distribution](#input\_distribution) | Method used to distribute log data to the destination. Random or ByLogStream are valid options | `string` | `"ByLogStream"` | no |
| <a name="input_filter_pattern"></a> [filter\_pattern](#input\_filter\_pattern) | Valid CloudWatch filter pattern for subscribing to a stream of log events | `string` | `""` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | ARN of the IAM role to use | `string` | `null` | no |
| <a name="input_log_groups"></a> [log\_groups](#input\_log\_groups) | List of log group dicts to subscribe to | `list(any)` | `null` | no |
| <a name="input_retention_period_in_hours"></a> [retention\_period\_in\_hours](#input\_retention\_period\_in\_hours) | Event retention in hours. 168 is 7 days | `number` | `168` | no |
| <a name="input_shard_count"></a> [shard\_count](#input\_shard\_count) | Number of shards to provision. Value MUST be set if using PROVISIONED stream\_mode | `string` | `null` | no |
| <a name="input_stream_mode"></a> [stream\_mode](#input\_stream\_mode) | Stream mode either ON\_DEMAND or PROVISIONED. If PROVISIONED then MUST set shard\_count | `string` | `"ON_DEMAND"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesis_stream_arn"></a> [kinesis\_stream\_arn](#output\_kinesis\_stream\_arn) | Kinesis stream ARN |
| <a name="output_kinesis_stream_name"></a> [kinesis\_stream\_name](#output\_kinesis\_stream\_name) | Kinesis stream name |
