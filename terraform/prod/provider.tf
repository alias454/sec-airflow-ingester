# Set terraform settings
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74"
    }
  }
  required_version = ">= 0.14.8"
}

# Configure the AWS Provider
provider "aws" {
  region = module.global_vars_module.region

  default_tags {
    tags = {
      RegionName  = module.global_vars_module.region
      environment = module.global_vars_module.environment_tag
      team        = module.global_vars_module.team_tag
      service     = module.global_vars_module.service_tag
      product     = module.global_vars_module.product_tag
    }
  }
}