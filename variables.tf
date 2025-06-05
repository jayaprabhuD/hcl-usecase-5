variable "upload_bucket_name" { 
  default = "upload_bucket_name"
}
variable "image_compressed_bucket_name" {
  default = "image_compressed_bucket_name"
}

#variable "sns_topic_name"     { default = "image-topic" }
#variable "lambda_function_name" { default = "lambda-image" }
#variable "resize_width" { default = 600 }
#
#variable "email" { 
#  default = "jayaprabhu.dheen@hcltech.com"
#}
#variable "lambda_role" { 
#  default = "lambda_role_s3_image"
#}