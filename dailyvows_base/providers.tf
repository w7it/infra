provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Application = "${local.appname}"
    }
  }
}

provider "random" {
}
