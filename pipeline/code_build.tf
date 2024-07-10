resource "aws_codebuild_project" "r_codeBuild_project" {
  name          = local.code_build_project_name
  description   = "Code build project for the pipeline"
  build_timeout = 5
  service_role  = var.code_build_role

  artifacts {
    # type = "NO_ARTIFACTS"
    type = "S3"
    location = aws_s3_bucket.r_codePipeline_s3.bucket
    path = "codebuild"
    packaging = "ZIP"
  }

  # cache {
  #   type     = "S3"
  #   location = aws_s3_bucket.r_codeBuild_s3.bucket
  # }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "LAMBDA_FUNCTION_NAME"
      value = "${local.lambda_function_name}"
    }

    # environment_variable {
    #   name  = "SOME_KEY2"
    #   value = "SOME_VALUE2"
    #   type  = "PARAMETER_STORE"
    # }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "${local.code_build_log_group}"
      stream_name = "${local.code_build_log_stream}"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${aws_s3_bucket.r_codeBuild_s3.id}/build-log"
    }
  }

  source {
    type            = "CODECOMMIT"
    location        = "${aws_codecommit_repository.r_codeCommit_repository.clone_url_http}"
    git_clone_depth = 1
    buildspec = <<EOF

    version: 0.2

    phases:
      build:
        commands:
          - echo "Hello World"
EOF
  }
}