resource "nuon_helm_chart_component" "helm_chart" {
  app_id     = nuon_app.my_eks_app.id
  name       = "helm_chart"
  chart_name = "introspect"
  public_repo = {
    repo      = "nuonco/guides"
    directory = "aws-eks-tutorial/components/helm-chart"
    branch    = "main"
  }
  value {
    name  = "image.repository"
    value = "{{.nuon.components.docker_image.image.repository.uri}}"
  }
  value {
    name  = "image.tag"
    value = "{{.nuon.components.docker_image.image.tag}}"
  }
  value {
    name  = "api.nlbs.public_domain_certificate"
    value = "{{.nuon.components.certificate.outputs.public_domain_certificate_arn}}"
  }
  value {
    name  = "api.nlbs.public_domain"
    value = "nlb.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }
  value {
    name  = "app_id"
    value = "{{.nuon.app.id}}"
  }
  value {
    name  = "org_id"
    value = "{{.nuon.org.id}}"
  }
  value {
    name  = "install_id"
    value = "{{.nuon.install.id}}"
  }
  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
