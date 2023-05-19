resource "aws_instance" "my_instances" {
  count         = var.instance_count
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
}
