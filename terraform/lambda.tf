data "archive_file" "helloWorldLambdaZip" {
  type              = "zip"
  source_dir        = "functions/helloWorldLambda"
  output_path       = "output/helloWorldLambda.zip"
}

resource "aws_lambda_function" "schibbler_helloWorldLambda" {
  filename          = "output/helloWorldLambda.zip"
  source_code_hash  = "${data.archive_file.helloWorldLambdaZip.output_base64sha256}"
  function_name     = "schibblerhelloWorldLambda"
  handler           = "index.handler"
  role              = "${aws_iam_role.helloWorldLambda.arn}"
  runtime           = "nodejs8.10"
}

resource "aws_lambda_permission" "restInvokation" {
  statement_id              = "AllowExecutionFromAPIGateway"
  action                    = "lambda:InvokeFunction"
  function_name             = "${aws_lambda_function.schibbler_helloWorldLambda.arn}"
  principal                 = "apigateway.amazonaws.com"

  source_arn                = "${aws_api_gateway_deployment.helloWorldGateway.execution_arn}/GET/hello"
}