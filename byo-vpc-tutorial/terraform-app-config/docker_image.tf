resource "nuon_docker_build_component" "docker_image" {
  app_id = nuon_app.my_byovpc_app.id
  name   = "docker_image"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "byo-vpc-tutorial/components/docker-image"
    branch    = "main"
  }
}
