resource "aws_instance" "web" {
  count         = var.instance_cnt
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "Web-${count.index}"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance ${count.index}" > /var/www/html/index.html
              EOF
}

