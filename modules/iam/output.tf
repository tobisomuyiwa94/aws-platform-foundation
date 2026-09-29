output "role_arn" {
  description = "ARN of the platform IAM role"
  value       = aws_iam_role.platform.arn
}