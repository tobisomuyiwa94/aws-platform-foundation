output "vpc_id" {
  description = "ID of the development VPC"
  value       = module.vpc.vpc_id
}

output "role_arn" {
  description = "ARN of the platform IAM role"
  value       = module.iam.role_arn
}