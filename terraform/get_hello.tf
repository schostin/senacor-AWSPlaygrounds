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

data "aws_iam_policy_document" "helloWorldLambda_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "helloWorldLambda" {
  name = "schibbler_helloWorldLambda_role"
  
  assume_role_policy = "${data.aws_iam_policy_document.helloWorldLambda_policy.json}"
}


resource "aws_iam_role_policy_attachment" "helloWorldLambda_policyAttachment" {
  role = "${aws_iam_role.helloWorldLambda.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_api_gateway_resource" "helloWorld" {
  rest_api_id     = "${aws_api_gateway_rest_api.helloWorldGateway.id}"
  parent_id       = "${aws_api_gateway_rest_api.helloWorldGateway.root_resource_id}"
  path_part       = "hello"
}

resource "aws_api_gateway_method" "helloWorldGet" {
  rest_api_id     = "${aws_api_gateway_rest_api.helloWorldGateway.id}"
  resource_id     = "${aws_api_gateway_resource.helloWorld.id}"
  http_method     = "GET"
  authorization   = "NONE"
}

resource "aws_api_gateway_integration" "helloWorldGet" {
  rest_api_id                 = "${aws_api_gateway_rest_api.helloWorldGateway.id}"
  resource_id                 = "${aws_api_gateway_resource.helloWorld.id}"
  http_method                 = "${aws_api_gateway_method.helloWorldGet.http_method}"
  integration_http_method     = "POST"
  type                        = "AWS_PROXY"
  uri                         = "${aws_lambda_function.schibbler_helloWorldLambda.invoke_arn}"
}

resource "aws_lambda_permission" "restInvokation" {
  statement_id              = "AllowExecutionFromAPIGateway"
  action                    = "lambda:InvokeFunction"
  function_name             = "${aws_lambda_function.schibbler_helloWorldLambda.arn}"
  principal                 = "apigateway.amazonaws.com"

  source_arn                = "${aws_api_gateway_deployment.helloWorldGateway.execution_arn}/GET/hello"
}