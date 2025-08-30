name_prefix         = "dev-oracle"
vpc_id              = "vpc-027857c7c38740a74"
private_subnet_ids  = ["subnet-0920379bf86d5f976", "subnet-0db2e3e8339da2d96"]
allowed_cidr_blocks = ["10.0.0.0/16"]

engine_edition = "oracle-se2"
engine_version = "19"
instance_class = "db.r6i.large"
multi_az       = false

username = "admin"
password = "SuperSecretPass123!"
db_port  = 1522  # Secure port

# Parameter group
db_parameters = [
  { name = "distributed_lock_timeout", value = "1800" },
  { name = "java_pool_size", value = "0" },
  { name = "job_queue_processes", value = "1000" },
  { name = "nls_date_format", value = "DD-MON-YYYY" },
  { name = "open_cursors", value = "500" },
  { name = "optimizer_adaptive_plans", value = "FALSE" },
  { name = "optimizer_adaptive_reporting_only", value = "TRUE" },
  { name = "resource_limit", value = "TRUE" }
]

# Option group
db_options = [
  {
    option_name = "TDE"
    persistent  = true
    permanent   = true
  },
  {
    option_name = "S3_INTEGRATION"
    version     = "1.0"
    persistent  = false
    permanent   = false
  },
  {
    option_name = "TIMEZONE_FILE_AUTOUPGRADE"
    persistent  = false
    permanent   = false
  },
  {
    option_name = "Timezone"
    persistent  = true
    permanent   = true
    option_settings = [
      { name = "TIME_ZONE", value = "Europe/London" }
    ]
  }
]
