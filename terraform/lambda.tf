data "archive_file" "loginLambdaZip" {
  type              = "zip"
  source_dir        = "functions/loginLambda"
  output_path       = "output/loginLambda.zip"
}

resource "aws_lambda_function" "schibbler_loginLambda" {
  filename          = "output/loginLambda.zip"
  source_code_hash  = "${data.archive_file.loginLambdaZip.output_base64sha256}"
  function_name     = "schibblerLoginLambda"
  handler           = "index.handler"
  role              = "${aws_iam_role.loginLambda.arn}"
  runtime           = "nodejs8.10"
}