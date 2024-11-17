resource "aws_s3_bucket" "web_bucket" {
  bucket_prefix = "static-site-"
  force_destroy = true


}


resource "aws_s3_bucket_website_configuration" "web_bucket" {
  bucket = aws_s3_bucket.web_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

