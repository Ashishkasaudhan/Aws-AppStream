resource "aws_iam_role" "appstream_imagebuilder_role" {
  name        = "appstream-imagebuilder-s3-role"
  description = "IAM permissions for image builder instance to access S3 bucket"
  managed_policy_arns = [
    aws_iam_policy.appstream_imagebuilder.arn,
  ]
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "appstream.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "appstream_imagebuilder" {
  name        = "appstream-imagebuilder-instance"
  description = "IAM permissions for AppStream Imagebuilder instance"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}