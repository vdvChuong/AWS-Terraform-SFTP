resource "aws_iam_role" "tftest_role" {
  name               = "tftest-sftp"
#   description        = "tf test role"
  managed_policy_arns = [aws_iam_policy.s3policy.arn]

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



#   inline_policy {
#     name = "tf-inline-policy"

#     policy = jsonencode({
#       Version = "2012-10-17"
#       Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#         Service = "transfer.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       },
#       ]
#     })
#   }


#   inline_policy {
#     name   = "policy-8675309"
#     policy = data.aws_iam_policy_document.inline_policy.json
#   }


# data "aws_iam_policy_document" "inline_policy" {
#   statement {
#     actions   = ["ec2:DescribeAccountAttributes"]
#     resources = ["*"]
#   }
# }