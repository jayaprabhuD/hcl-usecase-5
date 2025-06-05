resource "aws_lambda_function" "picture_compress" {
  function_name    = var.function_name
  role             = var.role_arn
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  filename         = "${path.module}/../../file/js/picture_compress.zip"
  source_code_hash = filebase64sha256("${path.module}/../../file/js/picture_compress.zip")
 
  environment {
    variables = {
      DEST_BUCKET    = var.image-compressed-bucket-name
      SNS_TOPIC_ARN  = var.sns_topic_arn
      RESIZE_WIDTH   = var.resize_width
      RESIZED_BUCKET_NAME = var.image-compressed-bucket-name
    }
  }
 
  tags = var.tags
}
 
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.picture_compress.arn
  principal = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.source_bucket_name}"
}
 
resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = var.upload_bucket_name
 
  lambda_function {
    lambda_function_arn = aws_lambda_function.picture_compress.arn
    events              = ["s3:ObjectCreated:*"]
  }
 
  depends_on = [aws_lambda_permission.allow_s3]
}