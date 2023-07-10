data "aws_route53_zone" "default" {
  name         = local.base_domain
  private_zone = false
}

resource "aws_route53_record" "dailyvows_a" {
  zone_id = data.aws_route53_zone.default.id
  name    = aws_apigatewayv2_domain_name.dailyvows_api.domain_name
  type    = "A"

  alias {
    name                   = aws_apigatewayv2_domain_name.dailyvows_api.domain_name_configuration[0].target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.dailyvows_api.domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "dailyvows_validation" {
  for_each = {
    for dvo in aws_acm_certificate.dailyvows_api.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id         = data.aws_route53_zone.default.id
  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  ttl             = 60
  records         = [each.value.record]
}
