terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "CesarRichardEI"
    workspaces {
      name = "terraform"
    }
  }
}