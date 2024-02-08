resource "nuon_docker_build_component" "docker_image" {
  app_id = nuon_app.my_eks_app.id
  name   = "docker_image"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "create-an-aws-eks-byoc-app/components/docker-image"
    branch    = "main"
  }
}
