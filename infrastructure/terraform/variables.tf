variable "vpc_cidr_block" {
  description = "vpc-cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "subnet-cidr"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "subnet-AZ"
  type        = string
  default     = "us-east-1a"
}

variable "bucket_name" {
  description = "s3-bucket"
  type        = string
  default     = "my-app-assets"
}

variable "instance_count" {
  description = "ec2-count"
  type        = number
  default     = 2
}

variable "instance_ami" {
  description = "ec2-ami"
  type        = string
  default     = "ami-0c94855ba95c71c99"
}

variable "instance_type" {
  description = "ec2-type"
  type        = string
  default     = "t2.micro"
}

variable "database_identifier" {
  description = "rds-db-id"
  type        = string
  default     = "my-db"
}

variable "database_allocated_storage" {
  description = "rds-db-storage"
  type        = number
  default     = 20
}

variable "database_engine" {
  description = "rds-db-type"
  type        = string
  default     = "postgres"
}

variable "database_instance_class" {
  description = "rds-db-class"
  type        = string
  default     = "db.t2.micro"
}

variable "database_username" {
  description = "rds-db-usr"
  type        = string
  default     = "admin"
}

variable "database_password" {
  description = "rds-db-pass"
  type        = string
  default     = "admin123"
}
