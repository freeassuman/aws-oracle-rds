variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "allowed_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "engine_edition" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "db_port" {
  type    = number
  default = 1522
}

variable "db_parameters" {
  description = "Custom parameters for the DB parameter group"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-west-1"
}

variable "db_options" {
  description = "Custom options for the DB option group"
  type = list(object({
    option_name                    = string
    port                           = optional(number)
    version                        = optional(string)
    persistent                     = optional(bool)
    permanent                      = optional(bool)
    vpc_security_group_memberships = optional(list(string))
    option_settings = optional(list(object({
      name  = string
      value = string
    })))
  }))
  default = []
}
