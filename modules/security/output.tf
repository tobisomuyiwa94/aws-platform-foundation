output "public_access_block_id" {
  description = "ID of the S3 public access block"
  value       = aws_s3_bucket_public_access_block.platform.id
}