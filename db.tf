resource "aws_db_instance" "default" {
  identifier             = "tc"
  instance_class         = "db.t2.micro"
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "postgres"
  password               = "postgres"
  publicly_accessible    = true
  skip_final_snapshot    = true
}
