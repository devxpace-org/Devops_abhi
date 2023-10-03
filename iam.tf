
resource "aws_iam_role" "s3_access_role" {
  name = "S3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3AccessPolicy"
  description = "Allows access to the S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:s3:::mys3abhi",
          "arn:aws:s3:::mys3abhi/*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "s3_access_attachment" {
  name       = "S3AccessAttachment"
  roles      = [aws_iam_role.s3_access_role.name]
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
