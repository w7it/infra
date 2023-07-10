terraform {
  backend "s3" {
    bucket = "w7it-infra-tf-states"
    key    = "dailyvows_base.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "main" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket = "w7it-infra-tf-states"
    key    = "main.tfstate"
    region = "us-east-1"
  }
}

locals {
  appname = "dailyvows"
}
