## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.s3bucket_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Public block acls setting to enable blocking | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Public block policy setting to enable blocking | `bool` | `true` | no |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | Bucket acl can be private or public | `string` | `"private"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name to be created | `list(string)` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Create s3 bucket if true | `bool` | `true` | no |
| <a name="input_enable_lifecycle_rules"></a> [enable\_lifecycle\_rules](#input\_enable\_lifecycle\_rules) | Enable bucket lifecycle rules | `bool` | `true` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Ignore public acls setting to enable blocking | `bool` | `true` | no |
| <a name="input_lifecycle_expiration"></a> [lifecycle\_expiration](#input\_lifecycle\_expiration) | Days to keep data before purging | `number` | `90` | no |
| <a name="input_lifecycle_move_to_glacier"></a> [lifecycle\_move\_to\_glacier](#input\_lifecycle\_move\_to\_glacier) | Days until data migrates to GLACIER storage class | `number` | `60` | no |
| <a name="input_lifecycle_move_to_standard_ia"></a> [lifecycle\_move\_to\_standard\_ia](#input\_lifecycle\_move\_to\_standard\_ia) | Days until data migrates to STANDARD\_IA storage class | `number` | `30` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Restrict public buckets setting to enable blocking | `bool` | `true` | no |
| <a name="input_service_tag"></a> [service\_tag](#input\_service\_tag) | Tag value for service information | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn_list"></a> [bucket\_arn\_list](#output\_bucket\_arn\_list) | S3 Bucket ARN list |
| <a name="output_bucket_id_list"></a> [bucket\_id\_list](#output\_bucket\_id\_list) | S3 Bucket ID as a list |
| <a name="output_bucket_name_list"></a> [bucket\_name\_list](#output\_bucket\_name\_list) | S3 Bucket Name as a list |
