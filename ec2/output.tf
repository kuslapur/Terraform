output "aws_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.web-server.id
}


output "aws_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web-server.public_ip
}
