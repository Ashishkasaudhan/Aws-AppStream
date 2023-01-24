data "aws_caller_identity" "current" {}

data "aws_region" "current" {}



data "aws_subnets" "private" {
  tags = {
    ImageBuilderPlacement = "Yes"
  }
}