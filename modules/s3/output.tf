output "upload_bucket_arn" {
  value = aws_s3_bucket.upload-image.arn
}
 
output "image-compressed-bucket-name-arn" {
  value = aws_s3_bucket.dest.arn
}