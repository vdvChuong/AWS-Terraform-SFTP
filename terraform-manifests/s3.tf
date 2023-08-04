resource "aws_s3_bucket" "bucket1" {
  bucket = "my-tf-test-bucket"

  tags = {
    Environment = "Dev"
  }
}