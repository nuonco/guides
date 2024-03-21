resource "nuon_terraform_module_component" "dynamodb_table" {
  app_id = nuon_app.my_aws_lambda_app.id
  name   = "dynamodb_table"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-lambda-tutorial/components/dynamodb-table"
    branch    = "main"
  }

  # Service config

  var {
    name  = "name"
    value = "widgets"
  }

  var {
    name  = "hash_key"
    value = "ID"
  }

  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
