# -----------------------------------------------
# Main for xef-scan-ex01
# -----------------------------------------------
provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "base" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
}

resource "aws_eip" "base" {
  instance = aws_instance.base.id
}