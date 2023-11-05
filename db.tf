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

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tc-s1-32-vpc-vpc"

  enable_nat_gateway = true
  enable_vpn_gateway = true
}
