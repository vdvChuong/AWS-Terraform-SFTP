resource "aws_transfer_server" "sftp" {
  
  protocols   = ["SFTP"]

  identity_provider_type = "SERVICE_MANAGED"

  endpoint_type = "PUBLIC"

  domain = "S3"

}

resource "aws_transfer_user" "sftp_user" {
  server_id = aws_transfer_server.sftp.id
  user_name = "tftestuser"
  role      = aws_iam_role.tftest_role.arn
  home_directory = "/binhn-sftp-test/"
  #home_directory = "/${aws_s3_bucket.example.id}/"
}

resource "aws_transfer_ssh_key" "tf_ssh_key" {
  server_id = aws_transfer_server.sftp.id
  user_name = aws_transfer_user.sftp_user.user_name
  body      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD55bLPbDPmTa/Laui9UfkiXVzmoR28fKl17UzBVFily7sXUv8btJg3iMSIu2YwZGVolgw/1YK+1kfKd9/py/4P5+bUyWTo09GD9hXRykU7zoGGlemvklZ4NAogC2rWuRtKdIxayvgWLxAT5albfVJAwkmCKuZVTdkCccP6BKujgK9xLcp22zIMz8Q1OqtBebac5Dr87x8WSfjej27oPydUdu7uPgA2rnm95KlkqoPFz5g1/TfQlxFsACOUrTz05At5WJiMieHFMMCVRW2ltmDC/cIuUMifTQT/Q6sZKWnkuW25jXSDgJ0tEvSyHdk4LERmddF241/gS1bovDaeqm+d"
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
  value        = "tftest.sftp.tf.ls.dxc.com"
}

