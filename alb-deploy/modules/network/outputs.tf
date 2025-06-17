output "rhel_ami" {
  value = data.aws_ami.rhel.id
}

output "subnet1_id" {
  value = data.aws_subnet.subnet1.id
}

output "subnet2_id" {
  value = data.aws_subnet.subnet2.id
}
