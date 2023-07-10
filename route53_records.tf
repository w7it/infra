resource "aws_route53_record" "w7it_com_a" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = local.base_domain
  type    = "A"
  ttl     = "300"

  # GitHub Pages
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

resource "aws_route53_record" "w7it_com_aaaa" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = local.base_domain
  type    = "AAAA"
  ttl     = "300"

  # GitHub Pages
  records = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153",
  ]
}

resource "aws_route53_record" "w7it_com_mx" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = local.base_domain
  type    = "MX"
  ttl     = "300"

  # iCloud Mail
  records = [
    "10 mx01.mail.icloud.com.",
    "10 mx02.mail.icloud.com.",
  ]
}

resource "aws_route53_record" "w7it_com_txt" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = local.base_domain
  type    = "TXT"
  ttl     = "300"

  records = [
    "v=spf1 include:icloud.com ~all",
    "apple-domain=6HzkRYa23g63sJOy",
  ]
}

resource "aws_route53_record" "www_w7it_com_cname" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = "www.${local.base_domain}"
  type    = "CNAME"
  ttl     = "300"

  # GitHub Pages
  records = [
    "w7it.github.io."
  ]
}

resource "aws_route53_record" "dkim_w7it_com_cname" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = "sig1._domainkey.${local.base_domain}"
  type    = "CNAME"
  ttl     = "300"

  records = [
    "sig1.dkim.w7it.com.at.icloudmailadmin.com."
  ]
}

resource "aws_route53_record" "w7it_com_caa" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = local.base_domain
  type    = "CAA"
  ttl     = "300"

  records = [
    "0 issue \"amazon.com\"",
    "0 issue \"amazontrust.com\"",
    "0 issue \"awstrust.com\"",
    "0 issue \"amazonaws.com\"",
    "0 issuewild \"amazon.com\"",
    "0 issuewild \"amazontrust.com\"",
    "0 issuewild \"awstrust.com\"",
    "0 issuewild \"amazonaws.com\"",
  ]
}
