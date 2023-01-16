/*
module "init" {
  source = "git::https://github.globalpay.com/AWS-Ent/iac-framework-modules.git//init?ref=feature/tf13"
  # Use this local source to test changes to the init module without the need for a commit/push to the module/repo which hasn't been tested
  #source = "../../../../iac-framework-modules/init/"
}
*/

resource "aws_iam_role" "appstream_role" {
  name        = var.stack_name
  description = "IAM permissions to stream appstream ${var.stack_name} stack"
  managed_policy_arns = [
    aws_iam_policy.appstream_idp.arn,
  ]
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.${module.init.current_account_id}
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:saml-provider/okta"
        },
        "Action" : [
          "sts:AssumeRoleWithSAML",
          "sts:SetSourceIdentity",
          "sts:TagSession"
        ],
        "Condition" : {
          "StringEquals" : {
            "SAML:aud" : "https://signin.aws.amazon.com/saml"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "appstream_idp" {
  name        = "appstream-streaming-${var.stack_name}"
  description = "IAM permissions to stream appstream session for ${var.stack_name} stack"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "appstream:Stream"
        ]
        Effect   = "Allow"
        Resource = aws_appstream_stack.appstream_stack.arn
      }
    ]
  })
}