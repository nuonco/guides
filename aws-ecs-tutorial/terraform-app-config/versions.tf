terraform {
  required_version = ">= 1.3.7"

  required_providers {
    nuon = {
      source  = "nuonco/nuon"
      version = ">= 0.9.1"
    }

    utils = {
      source  = "cloudposse/utils"
      version = ">= 0.17.23"
    }
  }
}
