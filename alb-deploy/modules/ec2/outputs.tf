output "public_ips" {
  value = aws_instance.web[*].public_ip
}

output "instance_ids" {
  value = aws_instance.web[*].id
}
