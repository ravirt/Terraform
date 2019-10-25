provider "aws" {
  version = "~> 2.0"
  region  = "${var.aws_region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "test"
}