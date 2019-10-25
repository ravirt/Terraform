output "iam_group_name" {
    value = "${aws_iam_group.developers.name}"
}
output "iam_user_name" {
    value = "${aws_iam_user.test_user.name}"
}
output "iam_policy_name" {
    value = "${aws_iam_group_policy.lambda_s3_policy.name}"
}
