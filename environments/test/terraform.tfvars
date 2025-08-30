name_prefix         = "dev-oracle"
vpc_id              = "vpc-027857c7c38740a74"
private_subnet_ids  = ["subnet-0920379bf86d5f976", "subnet-0db2e3e8339da2d96"]
allowed_cidr_blocks = ["10.0.0.0/16"]

engine_edition = "oracle-ee"  # Enterprise Edition
engine_version = "19"
instance_class = "db.r6i.large"
multi_az       = false

username = "admin"
password = "SuperSecretPass123!"
db_port  = 1522

# Parameter group (static parameters use apply_method "pending-reboot")
db_parameters = [
  { name = "distributed_lock_timeout", value = "1800", apply_method = "pending-reboot" },
  { name = "java_pool_size", value = "0", apply_method = "pending-reboot" },
  { name = "job_queue_processes", value = "1000", apply_method = "pending-rebo_
