terraform {
  backend "s3" {
    bucket = "terrform-bucket-n"
    key    = "terraform"
    region = "eu-west-1"
  }
}