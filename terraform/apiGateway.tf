resource "aws_api_gateway_deployment" "helloWorldGateway" {
  depends_on      = [
    "aws_api_gateway_integration.helloWorldGet"
  ]

  rest_api_id     = "${aws_api_gateway_rest_api.helloWorldGateway.id}"
  stage_name      = "beta"
}

resource "aws_api_gateway_rest_api" "helloWorldGateway" {
  name            = "helloWorldApiGateway"
  description     = "Hello world example"

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

output "Gateway_URL" {
  value = "${aws_api_gateway_deployment.helloWorldGateway.invoke_url}"
}
