## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.dags_s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.s3_bucket_objects](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_public_access_block.dags_s3bucket_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [archive_file.plugins_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Public block acls setting to enable blocking | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Public block policy setting to enable blocking | `bool` | `true` | no |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | Bucket acl can be private or public | `string` | `"private"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name to be created | `string` | `null` | no |
| <a name="input_enable_bucket_versioning"></a> [enable\_bucket\_versioning](#input\_enable\_bucket\_versioning) | Enable bucket versioning | `bool` | `true` | no |
| <a name="input_enable_lifecycle_rules"></a> [enable\_lifecycle\_rules](#input\_enable\_lifecycle\_rules) | Enable bucket lifecycle rules | `bool` | `true` | no |
| <a name="input_expire_noncurrent_versions_in_days"></a> [expire\_noncurrent\_versions\_in\_days](#input\_expire\_noncurrent\_versions\_in\_days) | Source expiration in days for non-current file versions | `number` | `7` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Ignore public acls setting to enable blocking | `bool` | `true` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Restrict public buckets setting to enable blocking | `bool` | `true` | no |
| <a name="input_upload_file_path"></a> [upload\_file\_path](#input\_upload\_file\_path) | Source file path for DAGs, plugins, and requirements.txt | `string` | `"../files"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dags_bucket_arn"></a> [dags\_bucket\_arn](#output\_dags\_bucket\_arn) | DAGS S3 Bucket ARN |
| <a name="output_dags_bucket_id"></a> [dags\_bucket\_id](#output\_dags\_bucket\_id) | DAGS S3 Bucket ID |
| <a name="output_dags_bucket_name"></a> [dags\_bucket\_name](#output\_dags\_bucket\_name) | DAGS S3 Bucket Name |
| <a name="output_plugins_zip_object_version"></a> [plugins\_zip\_object\_version](#output\_plugins\_zip\_object\_version) | S3 object version ID for plugins.zip |
| <a name="output_requirements_txt_object_version"></a> [requirements\_txt\_object\_version](#output\_requirements\_txt\_object\_version) | S3 object version ID for requirements.txt |
