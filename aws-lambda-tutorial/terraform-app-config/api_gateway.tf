resource "nuon_terraform_module_component" "api_gateway" {
  app_id = nuon_app.my_aws_lambda_app.id
  name   = "api_gateway"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-lambda-tutorial/components/api-gateway"
    branch    = "main"
  }

  var {
    name  = "name"
    value = "api"
  }

  var {
    name  = "domain_name"
    value = "api.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }

  var {
    name  = "domain_name_certificate_arn"
    value = "{{.nuon.components.certificate.outputs.public_domain_certificate_arn}}"
  }

  var {
    name  = "lambda_function_arn"
    value = "{{.nuon.components.lambda_function.outputs.lambda_function_arn}}"
  }

  var {
    name  = "zone_id"
    value = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
  }

  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
