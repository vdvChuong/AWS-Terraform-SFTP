terraform {
  backend "s3" {
    bucket = "terraform-sftp-remote-state-bucket"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
  }
}