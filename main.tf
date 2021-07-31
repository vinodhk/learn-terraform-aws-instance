terraform {
  backend "remote" {
    organization = "power"
    workspaces {
      name = "Example-Workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0133407e358cc1af0"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
