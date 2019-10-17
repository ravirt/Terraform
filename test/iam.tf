resource "aws_iam_group_policy" "lambda_s3_policy" {
  name        = "lambda_s3_policy"
  group = "${aws_iam_group.developers.id}"

  policy = "${file("policies/iam.json")}"

  depends_on = [
      "aws_iam_group.developers"
  ]
}

resource "aws_iam_group" "developers" {
  name = "${var.iam_group_name}"
  path = "/"
}

resource "aws_iam_user" "test_user" {
    name = "${var.iam_user_name}"

}
resource "aws_iam_user_group_membership" "group_attachment" {
  user = "${aws_iam_user.test_user.name}"

  groups = [
    "${aws_iam_group.developers.name}",
  ]
}