provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      group              = "AppStream"
      department         = "devopscaptain"
      dataclassification = "DC1"
      description        = "Appstream deployment in us-east-1"
    }
  }
}