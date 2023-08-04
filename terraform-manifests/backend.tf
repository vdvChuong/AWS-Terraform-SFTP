terraform {
  backend "s3" {
    bucket = "dev-tf-remote-state-bucket"
    key = "tf/terraform.tfstate"
    region = "ap-southeast-2"
  }
}