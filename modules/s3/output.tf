output "upload-bucket-arn" {
  value = aws_s3_bucket.upload-image.arn
}
 
output "image-compressed-bucket-name-arn" {
  value = aws_s3_bucket.dest.arn
}