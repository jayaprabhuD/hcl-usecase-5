resource "aws_iam_role" "lambda_execution" {
  name = var.lambda_role
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}
 
resource "aws_iam_role_policy" "new_lambda_policy" {
  name = "new_lambda_policy"
  role = aws_iam_role.lambda_execution.id
 
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ],
        Resource = [
          "${var.upload_bucket_arn}/*",
          "${var.upload_bucket_arn}"
        ]
      },
      {
        Effect   = "Allow",
        Action   = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ],
        Resource = [
          "${var.image-compressed-bucket-name-arn}/*",
          "${var.image-compressed-bucket-name-arn}"
        ]
      },
      {
        Effect   = "Allow",
        Action   = ["sns:Publish"],
        Resource = var.sns_topic_arn
      },
      {
        Effect   = "Allow",
        Action   = ["logs:*"],
        Resource = "*"
      }
    ]
  })
}