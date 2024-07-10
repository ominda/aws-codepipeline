resource "aws_lambda_function" "r_lambda_function" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "${path.module}/scripts/lambda_function_payload.zip"
  function_name = local.lambda_function_name
  role          = var.lambda_role
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.d_lambda_source_file.output_base64sha256

  runtime = "python3.12"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
}