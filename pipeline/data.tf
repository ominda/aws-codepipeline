data "archive_file" "d_lambda_source_file" {
  type        = "zip"
  source_file = "${path.module}/scripts/lambda_function.py"
  output_path = "${path.module}/scripts/lambda_function_payload.zip"
}