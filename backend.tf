terraform {
  backend "s3" {
    bucket = "my-devx-bucket"
    key    = "assignment.tfstate"
    region = "us-east-1"
  }
}  
