resource "aws_iam_role" "tftest_role" {
  name               = "${var.PROJECT}-sftp"
  description        = "Terraform role"

  inline_policy {
    name = "${var.PROJECT}-inline-sftp"

    policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowListingOfUserFolder",
        Action = [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:s3:::binhn-sftp-test"
        ]
      },
      {
        Sid = "HomeDirObjectAccess",
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:DeleteObjectVersion",
          "s3:GetObjectVersion",
          "s3:GetObjectACL",
          "s3:PutObjectACL"
        ],
        Resource = "arn:aws:s3:::binhn-sftp-test/*"
      }
    ]
    })
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Principal = {
        Service = "transfer.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

}