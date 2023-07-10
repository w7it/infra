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

resource "aws_route53_record" "dkim_w7it_com_cname" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = "sig1._domainkey.${local.base_domain}"
  type    = "CNAME"
  ttl     = "300"

  records = [
    "sig1.dkim.w7it.com.at.icloudmailadmin.com."
  ]
}

resource "aws_route53_record" "dailyvows_w7it_com_a" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = "dailyvows.${local.base_domain}"
  type    = "A"
  ttl     = "300"

  # to Deno Deploy
  records = [
    "34.120.54.55",
  ]
}

resource "aws_route53_record" "dailyvows_w7it_com_aaaa" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = "dailyvows.${local.base_domain}"
  type    = "AAAA"
  ttl     = "300"

  # to Deno Deploy
  records = [
    "2600:1901:0:6d85::",
  ]
}

resource "aws_route53_record" "acme_dailyvows_w7it_com_cname" {
  zone_id = data.aws_route53_zone.w7it_com.id
  name    = "_acme-challenge.dailyvows.${local.base_domain}"
  type    = "CNAME"
  ttl     = "300"

  # to Deno Deploy
  records = [
    "eea9d9c11e644bb598880218._acme.deno.dev.",
  ]
}
