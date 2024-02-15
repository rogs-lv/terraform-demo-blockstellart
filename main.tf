terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "blockstellart" {
  ami           = "ami-0c20d88b0021158c6" #ami-0c20d88b0021158c6 Amazon Linux 64bits //us-east-2  # "ami-830c94e3" //us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "InstanceBlockstellart"
  }
}
