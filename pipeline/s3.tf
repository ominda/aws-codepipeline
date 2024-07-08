# Create S3 bucket to use in code Build
resource "aws_s3_bucket" "r_codeBuild_s3" {
  bucket = local.code_build_s3_name
  force_destroy = true
}

# resource "aws_s3_bucket_acl" "r_codeBuild_s3_acl" {
#   bucket = aws_s3_bucket.r_codeBuild_s3.id
#   acl    = "private"
# }

# Create S3 bucket to store artifacts
resource "aws_s3_bucket" "r_codePipeline_s3" {
  bucket = local.code_pipeline_s3_name
  force_destroy = true
}

# resource "aws_s3_bucket_acl" "r_codePipeline_s3_acl" {
#   bucket = aws_s3_bucket.r_codePipeline_s3.id
#   acl    = "private"
# }