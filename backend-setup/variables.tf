variable "region" {
  default = "ap-south-1"
}

variable "bucket_name" {
  default = "terraform-alb-state-prinz"
}

variable "dynamodb_table_name" {
  default = "terraform-alb-locks"
}
