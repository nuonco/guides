locals {
  private_subnet_id_list = split(" ", trim(var.private_subnet_ids, "[]"))
  public_subnet_id_list  = split(" ", trim(var.public_subnet_ids, "[]"))
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

variable "app_id" {
  type = string
}

variable "org_id" {
  type = string
}

variable "install_id" {
  type = string
}

# Load balancer config

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = string
}

variable "public_subnet_ids" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "zone_id" {
  type = string
}
