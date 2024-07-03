locals {
  base_name = "${var.default_tags["project"]}_${var.default_tags["environment"]}"
  code_pipeline_policy_name = "${local.base_name}-codePipeline-policy"
  code_pipeline_role_name = "${local.base_name}-codePipeline-role"
  code_pipeline_policy_attachment = "${local.base_name}-codePipeline-policy-attachment"
  code_commit_repo_name = "${local.base_name}-codeCommit-repository"
  code_build_project_name = "${local.base_name}-codeBuild-project"
  code_build_role_name = "${local.base_name}-codeBuild-role"
  code_build_policy_name = "${local.base_name}-codeBuild-policy"
  code_build_policy_attachment = "${local.base_name}-codeBuild-policy-attachment"
#   code_deploy_application_name = "${local.base_name}-codeDeploy-application"
#   code_deploy_deployment_group_name = "${local.base_name}-codeDeploy-deployment-group"
#   lambda_function_name = "${local.base_name}-lambda-function"
#   lambda_role_name = "${local.base_name}-lambda-role"
#   lambda_policy_name = "${local.base_name}-lambda-policy"
#   lambda_policy_attachment = "${local.base_name}-lambda-policy-attachment"
}