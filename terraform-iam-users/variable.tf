 variable "iam_user" {
  description = "List of IAM users to be created"
  type        = set(string)
  default = ["user1", "user2", "user3"]
  }