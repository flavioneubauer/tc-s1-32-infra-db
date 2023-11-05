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

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["aXCiBL0DJUoZ2g.atlasv1.24cureWrIxwkr8T72lG0q6liCeJA6QKflCVpBEvyHysyRNPVrnX7BB7LRVdWyyUBlHsvpc-0cd75faecbced4a6a"]

  tags = {
    Name = "tc-s1-32-vpc-vpc"
  }
}
