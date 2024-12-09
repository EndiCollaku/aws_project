resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.APP_NAME}-subnet-group-rds"
  subnet_ids = var.SUBNET_IDS

  tags = {
    Name = "${var.APP_NAME}-subnet-group-db-rds"
  }
}


resource "aws_security_group" "db_security_group" {
  name        = "${var.APP_NAME}-security-group"
  description = "Security group for RDS PostgreSQL database"
  vpc_id      = var.VPC_ID


  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.APP_NAME}-security-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "${var.APP_NAME}-db-instance"
  engine                  = "postgres"
  engine_version          = "16.3"
  db_name                 = var.DB_NAME
  instance_class          = var.DB_INSTANCE_CLASS
  allocated_storage       = var.DB_ALLOCATED_STORAGE
  username                = var.DB_USERNAME
  password                = var.DB_PASSWORD
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.db_security_group.id]
  publicly_accessible     = true
  multi_az                = false
  backup_retention_period = 7
  skip_final_snapshot     = true

  tags = {
    Name = "${var.APP_NAME}-db-instance"
  }
}