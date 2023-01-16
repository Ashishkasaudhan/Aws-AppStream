output "imagebuilder_arn" {
  value       = aws_appstream_image_builder.test.arn
  description = "ARN of the created imagebuilder instance"
}

output "imagebuilder_id" {
  value       = aws_appstream_image_builder.test.id
  description = "Name of the created imagebuilder instance"
}