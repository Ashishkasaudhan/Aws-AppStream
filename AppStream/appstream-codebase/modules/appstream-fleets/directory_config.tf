/*
resource "aws_appstream_directory_config" "AD-mgmt-fleet" {
  directory_name                          = var.directory_name
  organizational_unit_distinguished_names = var.ou_name

  service_account_credentials {
    account_name     = "appstream_svc"
    account_password = "nebula123@pwc"
  }
}
*/