## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_notification.bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_sqs_queue.sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.sqs_queue_deadletter_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.sqs_queue_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | Bucket arn for queue policy | `list(string)` | `null` | no |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | Bucket id for queue notifications | `list(string)` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Create SQS queue if true | `bool` | `false` | no |
| <a name="input_max_receive_count"></a> [max\_receive\_count](#input\_max\_receive\_count) | Times a consumer tries getting a message without deleting it before it moves to the DLQ | `number` | `4` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Name of the SQS queue to create | `list(string)` | `null` | no |
| <a name="input_service_tag"></a> [service\_tag](#input\_service\_tag) | Tag value for service information | `string` | `"sec-data"` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | Visibility timeout for the queue | `number` | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | SQS queue arn |
| <a name="output_sqs_queue_name"></a> [sqs\_queue\_name](#output\_sqs\_queue\_name) | SQS queue name |
