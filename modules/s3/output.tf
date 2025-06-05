output "upload_bucket_arn" {
  value = aws_s3_bucket.upload.arn
}
 
output "dest_bucket_arn" {
  value = aws_s3_bucket.dest.arn
}