output "stack_arn" {
  value       = aws_appstream_stack.appstream_stack.arn
  description = "ARN of the created appstream stack"
}

output "appstream_iam_role_arn" {
  value       = aws_iam_role.appstream_role.arn
  description = "ARN of the IAM role to stream appstream stack with federated users as principal"
}
