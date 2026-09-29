resource "aws_iam_role" "platform" {
  name = "platform-dev-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_policy" "platform_s3_read" {
  name        = "platform-dev-s3-read"
  description = "Read-only access to the platform S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject"
        ]

        Resource = "${var.bucket_arn}/*"
      },
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = var.bucket_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "platform_s3_read" {
  role       = aws_iam_role.platform.name
  policy_arn = aws_iam_policy.platform_s3_read.arn
}