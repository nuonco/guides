resource "nuon_docker_build_component" "docker_image" {
  app_id = nuon_app.my_aws_lambda_app.id
  name   = "docker_image"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-lambda-tutorial/components/api"
    branch    = "main"
  }
}
