resource "nuon_app_sandbox" "main" {
  app_id            = nuon_app.my_eks_app.id
  terraform_version = "v1.6.3"
  public_repo = {
    repo      = "nuonco/sandboxes"
    branch    = "main"
    directory = "aws-eks"
  }
}
