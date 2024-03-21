resource "nuon_app_runner" "main" {
  app_id      = nuon_app.my_aws_lambda_app.id
  runner_type = "aws-ecs"
}
