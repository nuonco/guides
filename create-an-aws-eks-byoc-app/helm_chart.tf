resource "nuon_helm_chart_component" "helm_chart" {
  app_id     = nuon_app.my_eks_app.id
  name       = "helm_chart"
  chart_name = nuon_app.my_eks_app.name

  public_repo = {
    repo      = "nuonco/guides"
    directory = "create-an-aws-eks-byoc-app/components/helm-chart"
    branch    = "main"
  }

  # Service config

  value {
    name  = "serviceAccount.name"
    value = "api"
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
    name  = "env.NUON_APP_ID"
    value = "{{.nuon.app.id}}"
  }

  value {
    name  = "env.NUON_ORG_ID"
    value = "{{.nuon.org.id}}"
  }

  value {
    name  = "env.NUON_INSTALL_ID"
    value = "{{.nuon.install.id}}"
  }

  # Load balancer config

  value {
    name  = "api.ingresses.public_domain"
    value = "api.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }

  value {
    name  = "api.ingresses.internal_domain"
    value = "api.{{.nuon.install.sandbox.outputs.internal_domain.name}}"
  }

  value {
    name  = "api.nlbs.public_domain"
    value = "nlb.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }

  value {
    name  = "api.nlbs.internal_domain"
    value = "nlb.internal.{{.nuon.install.sandbox.outputs.internal_domain.name}}"
  }

  value {
    name  = "api.nlbs.public_domain_certificate_arn"
    value = "{{.nuon.components.certificate.outputs.public_domain_certificate_arn}}"
  }

  dependencies = [
    nuon_docker_build_component.docker_image.id
  ]
}
