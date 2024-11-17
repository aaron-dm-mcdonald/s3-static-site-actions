output "s3_bucket_name" {
  value = aws_s3_bucket.web_bucket.bucket
}

output "command" {
  value = "aws s3 sync ../web/ s3://${aws_s3_bucket.web_bucket.bucket}"
}

output "s3_website_url" {
  value = "http://${aws_s3_bucket.web_bucket.website_endpoint}"
}