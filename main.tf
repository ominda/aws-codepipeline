module "m_iam" {
  source = "./iam"
  default_tags = var.v_default_tags
}
module "m_pipeline" {
    source = "./pipeline"
    default_tags = var.v_default_tags
    code_build_role = module.m_iam.o_codeBuild_role_arn
    code_pipeline_role = module.m_iam.o_codePipeline_role_arn
}
