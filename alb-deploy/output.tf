output "elb-dns-name" {
  value = aws_lb.alb.dns_name
}

output "web_instance_public_ips" {
  value = aws_instance.web[*].public_ip
}
