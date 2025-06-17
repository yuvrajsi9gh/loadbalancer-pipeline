output "alb_dns" {
  value = module.alb.alb_dns
}

output "instance_ips" {
  value = module.ec2.public_ips
}
