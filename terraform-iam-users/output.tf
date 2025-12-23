output "iam_user_ids" {
  description = "List of IAM User IDs created"
  value       = [for user in aws_iam_user.iam_users : user.id]
}

