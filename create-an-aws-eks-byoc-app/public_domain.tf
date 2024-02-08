# TODO: Needed this last time, but the helm operator should be able to create a cert for me.
# resource "nuon_terraform_module_component" "public_domain" {
#   app_id = nuon_app.my_eks_app.id
#   name   = "public_domain"
# 
#   public_repo = {
#     repo      = "nuonco/guides"
#     directory = "create-an-aws-ecs-byoc-app/components/public-domain"
#     branch    = "main"
#   }
# 
#   var {
#     name  = "service_name"
#     value = "{{.nuon.app.name}}"
#   }
# 
#   var {
#     name  = "domain_name"
#     value = "api.{{.nuon.install.sandbox.outputs.public_domain.name}}"
#   }
# 
#   var {
#     name  = "zone_id"
#     value = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
#   }
# }
