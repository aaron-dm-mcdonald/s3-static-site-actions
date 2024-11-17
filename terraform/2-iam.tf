resource "aws_s3_bucket_public_access_block" "web_bucket_block" {
  bucket = aws_s3_bucket.web_bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

# Bucket Policy to allow public access to all objects in the bucket
resource "aws_s3_bucket_policy" "web_bucket_policy" {
  bucket = aws_s3_bucket.web_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.web_bucket.arn}/*"  # Allow access to all objects
      }
    ]
  })
}
