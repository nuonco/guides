resource "nuon_terraform_module_component" "ecs_service" {
  app_id = nuon_app.my_byovpc_app.id
  name   = "ecs_service"

  public_repo = {
    repo      = "nuonco/guides"
    directory = "byo-vpc-tutorial/components/ecs-service"
    branch    = "main"
  }

  # Service config

  var {
    name  = "service_name"
    value = "introspect"
  }

  var {
    name  = "cluster_arn"
    value = "{{.nuon.install.sandbox.outputs.ecs_cluster.arn}}"
  }

  var {
    name  = "image_url"
    value = "{{.nuon.components.docker_image.image.repository.uri}}"
  }

  var {
    name  = "image_tag"
    value = "{{.nuon.components.docker_image.image.tag}}"
  }

  var {
    name  = "app_id"
    value = "{{.nuon.app.id}}"
  }

  var {
    name  = "org_id"
    value = "{{.nuon.org.id}}"
  }

  var {
    name  = "install_id"
    value = "{{.nuon.install.id}}"
  }


  # Load balancer config

  var {
    name  = "vpc_id"
    value = "{{.nuon.install.sandbox.outputs.vpc.id}}"
  }

  var {
    name  = "domain_name"
    value = "introspect.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }

  var {
    name  = "zone_id"
    value = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
  }

  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
