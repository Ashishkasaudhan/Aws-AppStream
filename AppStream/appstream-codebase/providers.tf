provider "aws" {
  region = "us-east-1"
  default_tags {
   tags = {
    group              = "AppStream"
    department         = "EUC"
    dataclassification = "DC1"
    description        = "Appstream deployment in us-east-1"
   }
  }
}