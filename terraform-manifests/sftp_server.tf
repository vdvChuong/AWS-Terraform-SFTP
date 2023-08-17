resource "aws_transfer_server" "sftp" {
  
  protocols              = ["SFTP"]

  identity_provider_type = "SERVICE_MANAGED"

  endpoint_type          = "PUBLIC"

  domain                 = "S3"

  depends_on = [
    aws_iam_role.tftest_role,
    aws_route53_zone.main
  ]

}

resource "aws_transfer_user" "sftp_user" {
  server_id      = aws_transfer_server.sftp.id
  user_name      = var.SFTP_USER
  role           = aws_iam_role.tftest_role.arn
  home_directory = "/${var.BUCKET_NAME}/"
}

resource "aws_transfer_ssh_key" "tf_ssh_key" {
  server_id = aws_transfer_server.sftp.id
  user_name = aws_transfer_user.sftp_user.user_name
  body      = var.SSH_public_key
}

resource "aws_transfer_tag" "zone_id" {
  resource_arn = aws_transfer_server.sftp.arn
  key          = "transfer:route53HostedZoneId"
  #value        = "/hostedzone/Z00133922PAJIFNWNF0T5"
  value        = "/hostedzone/${aws_route53_zone.main.zone_id}"
}

resource "aws_transfer_tag" "hostname" {
  resource_arn = aws_transfer_server.sftp.arn
  key          = "transfer:customHostname"
  value        = "${var.PROJECT}.sftp.trs.ls.dxc.com"
}

