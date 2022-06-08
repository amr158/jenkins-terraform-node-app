terraform {
  backend "s3" {
    bucket = "terrform-bucket-amr"
    key    = "terraform"
    region = "eu-west-1"
  }
}