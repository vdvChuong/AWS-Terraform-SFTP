resource "aws_route53_zone" "main" {
  name = "sftp.cvo.ls.dxc.com"
}

resource "aws_route53_record" "ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "tff.sftp.cvo.ls.dxc.com"
  type    = "NS"
  ttl     = "172800"
  records = aws_route53_zone.main.name_servers
}