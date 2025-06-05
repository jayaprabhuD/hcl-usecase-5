variable "upload-bucket-name" { 
  default = "upload-image-bucket-name"
}
variable "image-compressed-bucket-name" {
  default = "image-compressed-bucket-name"
}

variable "sns_topic_name"     { default = "picture-topic" }
variable "lambda_function_name" { default = "lambda-picture" }
variable "resize_width" { default = 600 }

variable "email" { 
  default = "jayaprabhu.dheen@hcltech.com"
}
variable "lambda_role" { 
  default = "lambda_role_s3_picture"
}