# resource "aws_iam_policy" "s3policy" {
#   name        = "tf_sftp_policy"
#   description = "tf test policy"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#         {
#             Sid = "AllowListingOfUserFolder",
#             Action = [
#                 "s3:ListBucket",
#                 "s3:GetBucketLocation"
#             ],
#             Effect = "Allow",
#             Resource = [
#                 "arn:aws:s3:::binhn-sftp-test"
#             ]
#         },
#         {
#             Sid = "HomeDirObjectAccess",
#             Effect = "Allow",
#             Action = [
#                 "s3:PutObject",
#                 "s3:GetObject",
#                 "s3:DeleteObject",
#                 "s3:DeleteObjectVersion",
#                 "s3:GetObjectVersion",
#                 "s3:GetObjectACL",
#                 "s3:PutObjectACL"
#             ],
#             Resource = "arn:aws:s3:::binhn-sftp-test/*"
#       }
#     ]
#   })
# }