# Airflow Bucket to create for DAGS with lifecycle rules and versioning
resource "aws_s3_bucket" "dags_s3bucket" {
  bucket = var.bucket_name

  acl = var.bucket_acl

  lifecycle_rule {
    enabled = var.enable_lifecycle_rules

    noncurrent_version_expiration {
      days = var.expire_noncurrent_versions_in_days
    }
  }

  versioning {
    enabled = var.enable_bucket_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = var.bucket_name
  }

  lifecycle {
    prevent_destroy = true
  }
}

# Add global bucket policy defaults
resource "aws_s3_bucket_public_access_block" "dags_s3bucket_public_access" {
  bucket = aws_s3_bucket.dags_s3bucket.id

  lifecycle {
    prevent_destroy = true
  }

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

# Upload files from source directory to s3
resource "aws_s3_bucket_object" "s3_bucket_objects" {
  for_each               = fileset("${var.upload_file_path}/", "**/*")
  bucket                 = aws_s3_bucket.dags_s3bucket.id
  key                    = each.value
  source                 = "${var.upload_file_path}/${each.value}"
  source_hash            = filemd5("${var.upload_file_path}/${each.value}")
  server_side_encryption = "AES256"
}

# Create plugins.zip if files exist in plugins dir
data "archive_file" "plugins_zip" {
  type             = "zip"
  source_dir       = "${var.upload_file_path}/plugins/"
  output_path      = "${var.upload_file_path}/plugins.zip"
  output_file_mode = "0666"
  excludes         = ["${var.upload_file_path}/plugins/plugins.zip"]
}