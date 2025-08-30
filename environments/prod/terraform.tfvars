name_prefix         = "prod-oracle"
vpc_id              = "vpc-027857c7c38740a74"
private_subnet_ids  = ["subnet-0920379bf86d5f976", "subnet-0db2e3e8339da2d96"]
allowed_cidr_blocks = ["10.0.0.0/16"]

engine_edition = "oracle-ee"
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
  { name = "job_queue_processes", value = "1000", apply_method = "pending-reboot" },
  { name = "nls_date_format", value = "DD-MON-YYYY", apply_method = "pending-reboot" },
  { name = "open_cursors", value = "500", apply_method = "pending-reboot" },
  { name = "optimizer_adaptive_plans", value = "FALSE", apply_method = "pending-reboot" },
  { name = "optimizer_adaptive_reporting_only", value = "TRUE", apply_method = "pending-reboot" },
  { name = "resource_limit", value = "TRUE", apply_method = "pending-reboot" }
]


# Option group (remove unsupported persistent/permanent, keep only valid options)
db_options = [
  # TDE may not be valid in this region; verify before applying
  # Replace with valid options if AWS rejects it
  # For example, Timezone is generally safe
  {
    option_name = "Timezone"
    option_settings = [
      { name = "TIME_ZONE", value = "Europe/London" }
    ]
  }
]
