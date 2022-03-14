# Bucket to create with lifecycle rules
resource "aws_s3_bucket" "s3bucket" {
  count  = var.create ? length(var.bucket_name) : 0
  bucket = var.bucket_name[count.index]

  acl = var.bucket_acl

  lifecycle_rule {
    enabled = var.enable_lifecycle_rules

    transition {
      days          = var.lifecycle_move_to_standard_ia
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.lifecycle_move_to_glacier
      storage_class = "GLACIER"
    }

    expiration {
      days = var.lifecycle_expiration
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name    = var.bucket_name[count.index]
    service = var.service_tag
  }

  lifecycle {
    prevent_destroy = true
  }
}

# Add global bucket policy defaults
resource "aws_s3_bucket_public_access_block" "s3bucket_public_access" {
  count  = var.create ? length(aws_s3_bucket.s3bucket[*].id) : 0
  bucket = aws_s3_bucket.s3bucket[count.index].id

  lifecycle {
    prevent_destroy = true
  }

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
