// create route 53 cname record
resource "aws_route53_record" "cname_record" {
  zone_id = var.zone_id
  name = var.cname_record_name
  type = "CNAME"
  ttl = "300"
  records = [aws_alb.alb.dns_name]
}