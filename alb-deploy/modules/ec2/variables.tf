variable "subnet_id" {
  description = "Subnet ID to launch EC2 instances in"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "instance_cnt" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}
