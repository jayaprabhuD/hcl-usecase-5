resource "aws_s3_bucket" "upload" {
  bucket = var.upload-bucket-name

   server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

 
resource "aws_s3_bucket" "dest" {
  bucket = var.image-compressed-bucket-name
 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}