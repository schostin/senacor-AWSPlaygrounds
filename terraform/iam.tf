data "aws_iam_policy_document" "loginLambda_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "loginLambda" {
  name = "schibbler_loginLambda_iam"
  
  assume_role_policy = "${data.aws_iam_policy_document.loginLambda_policy.json}"
}


resource "aws_iam_role_policy_attachment" "loginLambda_policyAttachment" {
  role = "${aws_iam_role.loginLambda.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}