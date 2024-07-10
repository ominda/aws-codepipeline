resource "aws_codepipeline" "r_codePipeline" {
  name     = local.code_pipeline_name
  role_arn = var.code_pipeline_role

  artifact_store {
    location = aws_s3_bucket.r_codePipeline_s3.bucket
    type     = "S3"

    # encryption_key {
    #   id   = data.aws_kms_alias.s3kmskey.arn
    #   type = "KMS"
    # }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        # RepositoryName    = "${aws_codecommit_repository.r_codeCommit_repository.repository_id}"
        RepositoryName    = local.code_commit_repo_name
        BranchName = "main"
        PollForSourceChanges       = "false"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        # ProjectName = "${aws_codebuild_project.r_codeBuild_project.id}"
        ProjectName = "${aws_codebuild_project.r_codeBuild_project.id}"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Invoke"
      owner           = "AWS"
      provider        = "Lambda"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        FunctionName = aws_lambda_function.r_lambda_function.function_name
        UserParameters = <<EOF
        {
          "S3Bucket": "${aws_s3_bucket.r_codePipeline_s3.bucket}",
          "S3Key": "codebuild/${aws_codebuild_project.r_codeBuild_project.name}.zip"
        }
EOF
      }
    }
  }
}
