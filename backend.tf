terraform {
  backend "s3" {
    bucket         = "terraform-alb-state-prinz"
    key            = "alb/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-alb-locks"
  }
}
