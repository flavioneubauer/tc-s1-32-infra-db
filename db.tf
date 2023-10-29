resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "tc"
  engine               = "postgres"
  engine_version       = "16.0"
  instance_class       = "db.t2.micro"
  username             = "postgres"
  password             = "postgres"
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true
}
