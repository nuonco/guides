locals {
  subnet_id_list = split(" ", trim(var.subnet_ids, "[]"))
}

# Service config

variable "service_name" {
  type = string
}

variable "cluster_arn" {
  type = string
}

variable "image_url" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "update_this_var" {
  type = string
}

# Load balancer config

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "zone_id" {
  type = string
}
