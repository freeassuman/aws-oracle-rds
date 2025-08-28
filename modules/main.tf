# Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-subnet-group"
  subnet_ids = var.private_subnet_ids
}

# Security Group
resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Allow Oracle RDS traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Parameter Group
resource "aws_db_parameter_group" "this" {
  name        = "${var.name_prefix}-param-group"
  family      = "oracle-se2-${var.engine_version}"
  description = "Custom Oracle RDS parameter group"

  dynamic "parameter" {
    for_each = var.db_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

# Option Group
resource "aws_db_option_group" "this" {
  name                     = "${var.name_prefix}-option-group"
  engine_name              = "oracle-se2"
  major_engine_version     = var.engine_version
  option_group_description = "Custom Oracle RDS option group"

  dynamic "option" {
    for_each = var.db_options
    content {
      option_name = option.value.option_name
      port        = lookup(option.value, "port", null)
      version     = lookup(option.value, "version", null)
      persistent  = lookup(option.value, "persistent", null)
      permanent   = lookup(option.value, "permanent", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }
}

# DB Instance
resource "aws_db_instance" "this" {
  identifier              = "${var.name_prefix}-rds"
  allocated_storage       = 20
  max_allocated_storage   = 100
  engine                  = "oracle-se2"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  username                = var.username
  password                = var.password
  port                    = var.db_port
  multi_az                = var.multi_az
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.this.id]
  parameter_group_name    = aws_db_parameter_group.this.name
  option_group_name       = aws_db_option_group.this.name
  skip_final_snapshot     = true
}
