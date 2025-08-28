module "rds_oracle" {
  source              = "../modules/orcle-rds"

  name_prefix         = var.name_prefix
  vpc_id              = var.vpc_id
  private_subnet_ids  = var.private_subnet_ids
  allowed_cidr_blocks = var.allowed_cidr_blocks

  engine_edition = var.engine_edition
  engine_version = var.engine_version
  instance_class = var.instance_class
  multi_az       = var.multi_az
  username       = var.username
  password       = var.password
  db_port        = var.db_port

  db_parameters = var.db_parameters
  db_options    = var.db_options
}
