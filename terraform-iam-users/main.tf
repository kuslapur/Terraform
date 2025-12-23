provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "example_user"{
  for_each = var.iam_user 
    name = each.value
 }