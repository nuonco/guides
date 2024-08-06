locals {
  integrations = {
    "GET /widgets/{id}" = {
      lambda_arn             = var.lambda_function_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "POST /widgets" = {
      lambda_arn             = var.lambda_function_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }
  }
}

module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 5.1.0"

  name                                  = var.name
  integrations                          = local.integrations
  domain_name                           = var.domain_name
  domain_name_certificate_arn           = var.domain_name_certificate_arn
  protocol_type                         = "HTTP"
  create_default_stage_access_log_group = true

  default_route_settings = {
    detailed_metrics_enabled = true
    throttling_burst_limit   = 100
    throttling_rate_limit    = 100
  }

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }
}

resource "aws_lambda_permission" "permission" {
  function_name = element(split(":", var.lambda_function_arn), length(split(":", var.lambda_function_arn)) - 1)
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${module.api_gateway.apigatewayv2_api_execution_arn}/*/*"
}

resource "aws_route53_record" "custom_domain_record" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.api_gateway.apigatewayv2_domain_name_configuration[0].target_domain_name
    zone_id                = module.api_gateway.apigatewayv2_domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = false
  }
}
