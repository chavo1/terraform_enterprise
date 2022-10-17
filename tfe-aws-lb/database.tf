###Create  DB instance fot TFE
resource "aws_db_instance" "tfe-db" {
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "14"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  deletion_protection    = false
  availability_zone      = "${var.aws_region}a"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.id
  vpc_security_group_ids = [aws_security_group.tfe-db-sg.id]
}
###Create DB sunet groups
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private01.id, aws_subnet.private02.id]

  tags = {
    Name = "TFE-chavo DB private01 subnet group"
  }
}