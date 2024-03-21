resource "nuon_terraform_module_component" "certificate" {
  app_id = nuon_app.my_eks_app.id
  name   = "certificate"
  connected_repo = {
    repo      = "nuonco/guides"
    directory = "aws-eks-tutorial/components/certificate"
    branch    = "main"
  }
  var {
    name  = "domain_name"
    value = "introspect.{{.nuon.install.sandbox.outputs.public_domain.name}}"
  }
  var {
    name  = "zone_id"
    value = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
  }
}
