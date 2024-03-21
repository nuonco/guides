resource "nuon_terraform_module_component" "lambda_function" {
  app_id = nuon_app.my_aws_lambda_app.id
  name   = "lambda_function"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-lambda-tutorial/components/lambda-function"
    branch    = "main"
  }

  # Service config

  var {
    name  = "function_name"
    value = "widgets"
  }

  var {
    name  = "image_uri"
    value = "{{.nuon.components.docker_image.image.repository.uri}}:{{.nuon.components.docker_image.image.tag}}"
  }

  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
