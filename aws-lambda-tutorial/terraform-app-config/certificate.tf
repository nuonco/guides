resource "nuon_terraform_module_component" "certificate" {
  app_id = nuon_app.my_aws_lambda_app.id
  name   = "certificate"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-lambda-tutorial/components/certificate"
    branch    = "main"
  }

  # Service config

  var {
    name  = "domain_name"
    value = "api.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }

  var {
    name  = "zone_id"
    value = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
  }

  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
