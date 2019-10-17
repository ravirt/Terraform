terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-dev-2019"
    key            = "test.tf"
    region         = "us-east-1"
    profile        = "test"
    dynamodb_table = "terraform"
    encrypt        = true
  }
}
