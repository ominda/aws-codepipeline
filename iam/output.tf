output "o_codePipeline_role_arn" {
  value = aws_iam_role.r_codePipeline_role.arn
}
output "o_codeBuild_role_arn" {
  value = aws_iam_role.r_codeBuild_role.arn
}

output "o_eventBridge_role_arn" {
  value = aws_iam_role.r_eventBridge_role.arn  
}

output "o_lambda_role_arn" {
  value = aws_iam_role.r_lambda_role.arn
}