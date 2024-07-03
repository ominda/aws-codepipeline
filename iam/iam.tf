# Code Pipeline IAM role
resource "aws_iam_role" "r_codePipeline_role" {
  name = local.code_pipeline_role_name
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codepipeline.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
    }
  )
}

resource "aws_iam_policy_attachment" "r_codePipeline_policy_attachment" {
    name = local.code_pipeline_policy_attachment
    roles = [ aws_iam_role.r_codePipeline_role.name ]
    policy_arn = aws_iam_policy.r_codePipeline_policy.arn
}

# Code build IAM role
resource "aws_iam_role" "r_codeBuild_role" {
  name = local.code_build_role_name
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
    }
  )
}

resource "aws_iam_policy_attachment" "r_codeBuild_policy_attachment" {
    name = local.code_build_policy_attachment
    roles = [ aws_iam_role.r_codeBuild_role.name ]
    policy_arn = aws_iam_policy.r_codeBuild_policy.arn
}