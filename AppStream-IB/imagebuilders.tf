resource "aws_appstream_image_builder" "test" {
  name                           = "imagebuilder_EUC"
  description                    = "image builder instance"
  display_name                   = "imagebuilder_EUC"
  enable_default_internet_access = true
  image_name                     = var.image_name
  instance_type                  = var.instance_type
  iam_role_arn                   = aws_iam_role.appstream_imagebuilder_role.arn

  vpc_config {
    subnet_ids         = tolist(data.aws_subnets.private.ids)
    security_group_ids = tolist(data.aws_security_groups.appstream.ids)
  }

  # domain_join_info {
  #  directory_name                         = var.directory
  #   organizational_unit_distinguished_name = var.ou_name
  # }

  tags = {
    project = "Nebula"
  }
}