resource "aws_apigatewayv2_api" "dailyvows_api" {
  name          = "dailyvows_api_gw"
  protocol_type = "HTTP"
}
