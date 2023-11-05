resource "aws_db_subnet_group" "rds" {
  name       = "main"

  subnet_ids = [
    subnet-04126a9992f86bb7e,
    subnet-06aa4ee0821394c3b
  ]

  tags = {
    Name = "tc-s1-32-subnet-group"
  }
}

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
  db_subnet_group_name = aws_db_subnet_group.rds.name
}
