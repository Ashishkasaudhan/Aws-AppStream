data "aws_caller_identity" "current" {}

data "aws_region" "current" {}



data "aws_subnets" "private" {
  tags = {
    Project = "nebula"
  }
}

/*
data "aws_security_groups" "appstream" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  
  tags = {
    Project = "Nebula"
  }
  depends_on = [
    aws_security_group.appstream
  ]
}
*/