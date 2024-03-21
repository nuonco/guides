resource "nuon_app_runner" "main" {
  app_id      = nuon_app.my_byovpc_app.id
  runner_type = "aws-ecs"
}
