# To register OKTA as Identity Provider
resource "aws_iam_saml_provider" "idp" {
  count = var.saml_provider_provisioning == "true" ? 1 : 0
  name                   = var.saml_provider_name
  saml_metadata_document = file("${path.module}/saml-metadata.xml")
}
