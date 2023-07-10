resource "aws_apigatewayv2_api" "dailyvows_api" {
  name          = "dailyvows_api_gw"
  protocol_type = "HTTP"

  disable_execute_api_endpoint = true
}

resource "aws_apigatewayv2_domain_name" "dailyvows_api" {
  domain_name = local.domain
  domain_name_configuration {
    certificate_arn = aws_acm_certificate_validation.dailyvows_api.certificate_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_acm_certificate" "dailyvows_api" {
  domain_name       = local.domain
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "dailyvows_api" {
  certificate_arn         = aws_acm_certificate.dailyvows_api.arn
  validation_record_fqdns = [for record in aws_route53_record.dailyvows_validation : record.fqdn]
}
