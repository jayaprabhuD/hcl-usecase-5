module "s3" {
  source              = "./modules/s3"
  upload_bucket_name  = var.upload_bucket_name
  image-compressed-bucket-name    = var.image-compressed-bucket-name
 
}
 
module "sns" {
  source           = "./modules/sns"
  sns_topic_name   = var.sns_topic_name
  email            = var.email
}
 
module "iam" {
  source            = "./modules/iam"
  upload_bucket_arn = module.s3.upload-bucket-arn
  image-compressed-bucket-name-arn   = module.s3.image-compressed-bucket-name-arn
  sns_topic_arn     = module.sns.topic_arn
  lambda_role         = var.lambda_role
}
 
module "lambda" {
  source             = "./modules/lambda"
  function_name      = var.lambda_function_name
  role_arn           = module.iam.lambda_role_arn
  upload_bucket_name  = var.upload_bucket_name
  image-compressed-bucket-name   = var.image-compressed-bucket-name
  sns_topic_arn      = module.sns.topic_arn
  resize_width       = var.resize_width
  tags               = var.tags
}