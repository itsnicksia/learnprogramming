resource "aws_s3_bucket" "home_bucket" {
  bucket = "${local.aws_account_id}-${local.project_name}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "home_sse" {
  bucket = aws_s3_bucket.home_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "home_ownership" {
  bucket = aws_s3_bucket.home_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "home_access" {
  bucket = aws_s3_bucket.home_bucket.id

  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "home_policy" {
  bucket = aws_s3_bucket.home_bucket.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "${aws_s3_bucket.home_bucket.arn}/*",
          aws_s3_bucket.home_bucket.arn
        ],
        "Condition" : {
          "Bool" : {
            "aws:SecureTransport" : "false"
          }
        }
      },
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudfront.amazonaws.com"
        },
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : "${aws_s3_bucket.home_bucket.arn}/*",
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceArn" : local.cloudfront_distribution_arn
          }
        }
      }
    ]
  })
}