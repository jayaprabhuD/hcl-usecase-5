resource "aws_s3_bucket" "upload" {
  bucket = var.upload_bucket_name
  versioning {
    enabled = true
  }
 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
 
resource "aws_s3_bucket" "dest" {
  bucket = var.image_compressed_bucket_name
 
  versioning {
    enabled = true
  }
 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}