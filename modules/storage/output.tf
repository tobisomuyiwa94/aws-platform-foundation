output "bucket_name" {
  description = "Name of the platform S3 bucket"
  value       = aws_s3_bucket.platform.bucket
}

output "bucket_arn" {
  description = "ARN of the platform S3 bucket"
  value       = aws_s3_bucket.platform.arn
}