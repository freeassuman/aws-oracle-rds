terraform {
  required_version = ">= 1.11"

  backend "s3" {
    bucket       = "bat2nlblogs"
    key          = "oracle-rds/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}

