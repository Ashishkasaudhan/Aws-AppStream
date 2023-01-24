output "stack_arn" {
  value       = aws_appstream_stack.appstream_stack.arn
  description = "ARN of the created appstream stack"
}

