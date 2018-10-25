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

output "Gateway_URL" {
  value = "${aws_api_gateway_deployment.helloWorldGateway.invoke_url}"
}
