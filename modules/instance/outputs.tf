output "instance_id" {
  description = "ID of the ec2 instance"
  value       = aws_instance.main_instance.id
}
