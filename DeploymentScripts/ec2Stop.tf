resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["lambda.amazonaws.com", "ec2.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "ec-2stop.py.zip"
  function_name = "StopInstance"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "ec-2stop.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = "${filebase64sha256("ec-2stop.py.zip")}"

  runtime = "python3.6"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
module "execute" {
  source="connect-group/lambda-exec/aws"
  name = "StopInstance"
  lambda_function_arn = "arn:aws:lambda:us-east-1:284758585625:function:StopInstance"
  lambda_inputs = {
    run_on_every_apply = "${timestamp()}"
  }
  lambda_outputs = [
    "Error"
  ]
}