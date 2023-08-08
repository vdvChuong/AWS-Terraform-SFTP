# resource "aws_route53_zone" "main" {
#   name = "sftp.tf.ls.dxc.com"

#   depends_on = [
#     aws_transfer_server.sftp
#   ]
# }

# resource "aws_route53_record" "ns" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "sftp.tf.ls.dxc.com"
#   type    = "NS"
#   ttl     = "172800"
#   records = aws_route53_zone.main.name_servers
# }