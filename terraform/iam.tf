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