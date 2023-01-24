data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "vpc" {
  tags = {
    Name = "Aws-Devops-vpc"
  }
}

data "aws_subnets" "private" {
  tags = {
    ImageBuilderPlacement = "Yes"
  }
}

data "aws_security_groups" "appstream" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Name = "Aws-Devops-vpc"
}
}