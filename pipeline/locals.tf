locals {
  base_name = "${var.default_tags["project"]}_${var.default_tags["environment"]}"
  code_commit_repo_name = "${local.base_name}-codeCommit-repository"
  code_build_project_name = "${local.base_name}-codeBuild-project"
#   code_deploy_application_name = "${local.base_name}-codeDeploy-application"
#   code_deploy_deployment_group_name = "${local.base_name}-codeDeploy-deployment-group"
#   lambda_function_name = "${local.base_name}-lambda-function"
#   lambda_role_name = "${local.base_name}-lambda-role"
#   lambda_policy_name = "${local.base_name}-lambda-policy"
#   lambda_policy_attachment = "${local.base_name}-lambda-policy-attachment"
}