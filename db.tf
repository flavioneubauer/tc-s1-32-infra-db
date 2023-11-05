terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "rds" {
  name       = "main"

  subnet_ids = [
    "subnet-0c5c79843da5f2f23",
    "subnet-002e99eab31d76b50"
  ]

  tags = {
    Name = "tc-s1-32-subnet-group"
  }
}

resource "aws_db_instance" "tc" {
  identifier           = "tc"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "postgres"
  parameter_group_name = "default.postgres15"
  vpc_security_group_ids=["sg-0d74b8d63016e6404"] 
  db_subnet_group_name = aws_db_subnet_group.rds.name
  skip_final_snapshot  = true
}
