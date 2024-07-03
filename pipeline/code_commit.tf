resource "aws_codecommit_repository" "r_codeCommit_repository" {
  repository_name = local.code_commit_repo_name
  description     = "This repository hold web application contents"
}