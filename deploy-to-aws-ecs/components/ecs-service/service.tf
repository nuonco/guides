module "service" {
  source = "terraform-aws-modules/ecs/aws//modules/service"

  name        = var.service_name
  cluster_arn = var.cluster_arn

  cpu    = 1024
  memory = 4096

  container_definitions = {
    api = {
      cpu       = 512
      memory    = 1024
      essential = true
      image     = "${var.image_url}:${var.image_tag}"
      port_mappings = [
        {
          name          = "http"
          containerPort = 8080
          hostPort      = 8080
          protocol      = "http"
        }
      ]
      memory_reservation = 100
      environment = [
      ]
    }
  }

  load_balancer = {
    service = {
      target_group_arn = module.ingress.target_groups["api"].arn
      container_name   = "api"
      container_port   = 8080
    }
  }

  subnet_ids = local.subnet_id_list
  security_group_rules = {
    ingress_http = {
      type                     = "ingress"
      from_port                = 0
      to_port                  = 8080
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = module.ingress.security_group_arn
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Terraform   = "true"
    ServiceName = var.service_name
  }
}
