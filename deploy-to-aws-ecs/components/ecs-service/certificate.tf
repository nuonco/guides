module "cert" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name         = var.domain_name
  zone_id             = var.zone_id
  wait_for_validation = true

  tags = {
    Terraform   = "true"
    ServiceName = var.service_name
  }
}
