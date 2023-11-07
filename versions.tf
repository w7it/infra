terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.52"
    }
    neon = {
      source = "terraform-community-providers/neon"
      version = "~> 0.1.4"
    }
  }
}
