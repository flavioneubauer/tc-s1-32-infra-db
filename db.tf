resource "aws_db_instance" "default" {
  identifier           = "tc"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  name                 = "tc"
  username             = "postgres"
  password             = "postgres"
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true
}

resource "aws_vpc" "vpc" {
  cidr_block       = vpc-0cd75faecbced4a6a

  tags = {
    Name = "tc-s1-32-vpc-vpc"
  }
}
