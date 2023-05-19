resource "aws_db_instance" "my_database" {
  identifier               = var.database_identifier
  allocated_storage        = var.database_allocated_storage
  engine                   = var.database_engine
  instance_class           = var.database_instance_class
  vpc_security_group_ids   = [var.database_security_group_id]
  username                 = var.database_username
  password                 = var.database_password
}
