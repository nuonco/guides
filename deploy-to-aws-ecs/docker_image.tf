resource "nuon_docker_build_component" "docker_image" {
  app_id = nuon_app.my_ecs_app.id
  name   = "docker_image"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "deploy-to-aws-ecs/components/docker-image"
    branch    = "main"
  }
}
