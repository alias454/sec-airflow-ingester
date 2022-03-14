# Create role for the app to use
resource "aws_iam_role" "iam_role" {
  count = var.create ? 1 : 0

  name        = var.iam_name
  description = var.description

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Apply an inline policy to the iam role
resource "aws_iam_role_policy" "app_policy" {
  count = var.create ? 1 : 0

  name = var.iam_name
  role = aws_iam_role.iam_role[count.index].id

  policy = var.app_policy_data
}

# Attach additional policy
resource "aws_iam_role_policy_attachment" "app_policy_attachment" {
  count = var.create && var.allow_managed ? 1 : 0

  role       = aws_iam_role.iam_role[count.index].name
  policy_arn = var.managed_policy_arn
}