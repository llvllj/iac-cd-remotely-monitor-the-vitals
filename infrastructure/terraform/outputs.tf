output "vpc_id" {
  description = "vpc-id"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "subnet-id"
  value       = module.subnet.subnet_id
}

output "s3_bucket_name" {
  description = "s3-bucket"
  value       = module.s3.bucket
}

output "ec2_instance_ids" {
  description = "ec2-ids"
  value       = module.ec2.instance_ids
}

output "rds_endpoint" {
  description = "db-rds-endpoint"
  value       = module.rds.endpoint
}
