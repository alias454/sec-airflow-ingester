## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.app_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.app_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_managed"></a> [allow\_managed](#input\_allow\_managed) | Allow adding a managed policy | `bool` | `false` | no |
| <a name="input_app_policy_data"></a> [app\_policy\_data](#input\_app\_policy\_data) | AWS IAM policy data | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Create IAM role if true | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the IAM role | `string` | `null` | no |
| <a name="input_iam_name"></a> [iam\_name](#input\_iam\_name) | Name of the IAM role to create | `string` | `null` | no |
| <a name="input_managed_policy_arn"></a> [managed\_policy\_arn](#input\_managed\_policy\_arn) | ARN of the managed policy to add | `string` | `null` | no |
| <a name="input_role_principals"></a> [role\_principals](#input\_role\_principals) | Value for sts assume role principal identifiers | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | IAM Role arn |
