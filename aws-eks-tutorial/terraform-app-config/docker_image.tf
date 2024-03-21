resource "nuon_docker_build_component" "docker_image" {
  app_id     = nuon_app.my_eks_app.id
  name       = "docker_image"
  dockerfile = "Dockerfile"
  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-eks-tutorial/components/docker-image"
    branch    = "main"
  }
}
