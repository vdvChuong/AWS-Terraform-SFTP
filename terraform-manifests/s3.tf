resource "aws_s3_bucket" "bucket1" {
  bucket = "tf-test-bucket-8-4"

  tags = {
    Environment = "Dev"
  }
}