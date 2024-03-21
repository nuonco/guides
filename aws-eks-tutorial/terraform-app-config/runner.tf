resource "nuon_app_runner" "main" {
  app_id      = nuon_app.my_eks_app.id
  runner_type = "aws-eks"
}
